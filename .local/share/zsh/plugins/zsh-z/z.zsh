_z () {
	local datafile="${_Z_DATA:-$HOME/.z}" 
	[ -z "$_Z_OWNER" -a -f "$datafile" -a ! -O "$datafile" ] && return
	if [ "$1" = "--add" ]
	then
		shift
		[ "$*" = "$HOME" ] && return
		local exclude
		for exclude in "${_Z_EXCLUDE_DIRS[@]}"
		do
			case "$*" in
				("$exclude*") return ;;
			esac
		done
		local tempfile="$datafile.$RANDOM" 
		while read line
		do
			[ -d "${line%%\|*}" ] && echo $line
		done < "$datafile" | awk -v path="$*" -v now="$(date +%s)" -F"|" '
            BEGIN {
                rank[path] = 1
                time[path] = now
            }
            $2 >= 1 {
                # drop ranks below 1
                if( $1 == path ) {
                    rank[$1] = $2 + 1
                    time[$1] = now
                } else {
                    rank[$1] = $2
                    time[$1] = $3
                }
                count += $2
            }
            END {
                if( count > 9000 ) {
                    # aging
                    for( x in rank ) print x "|" 0.99*rank[x] "|" time[x]
                } else for( x in rank ) print x "|" rank[x] "|" time[x]
            }
        ' 2> /dev/null >| "$tempfile"
		if [ $? -ne 0 -a -f "$datafile" ]
		then
			env rm -f "$tempfile"
		else
			[ "$_Z_OWNER" ] && chown $_Z_OWNER:$(id -ng $_Z_OWNER) "$tempfile"
			env mv -f "$tempfile" "$datafile" || env rm -f "$tempfile"
		fi
	elif [ "$1" = "--complete" -a -s "$datafile" ]
	then
		while read line
		do
			[ -d "${line%%\|*}" ] && echo $line
		done < "$datafile" | awk -v q="$2" -F"|" '
            BEGIN {
                if( q == tolower(q) ) imatch = 1
                q = substr(q, 3)
                gsub(" ", ".*", q)
            }
            {
                if( imatch ) {
                    if( tolower($1) ~ tolower(q) ) print $1
                } else if( $1 ~ q ) print $1
            }
        ' 2> /dev/null
	else
		while [ "$1" ]
		do
			case "$1" in
				(--) while [ "$1" ]
					do
						shift
						local fnd="$fnd${fnd:+ }$1" 
					done ;;
				(-*) local opt=${1:1} 
					while [ "$opt" ]
					do
						case ${opt:0:1} in
							(c) local fnd="^$PWD $fnd"  ;;
							(h) echo "${_Z_CMD:-z} [-chlrtx] args" >&2
								return ;;
							(x) sed -i -e "\:^${PWD}|.*:d" "$datafile" ;;
							(l) local list=1  ;;
							(r) local typ="rank"  ;;
							(t) local typ="recent"  ;;
						esac
						opt=${opt:1} 
					done ;;
				(*) local fnd="$fnd${fnd:+ }$1"  ;;
			esac
			local last=$1 
			[ "$#" -gt 0 ] && shift
		done
		[ "$fnd" -a "$fnd" != "^$PWD " ] || local list=1 
		case "$last" in
			(/*) [ -z "$list" -a -d "$last" ] && cd "$last" && return ;;
		esac
		[ -f "$datafile" ] || return
		local cd
		cd="$(while read line; do
            [ -d "${line%%\|*}" ] && echo $line
        done < "$datafile" | awk -v t="$(date +%s)" -v list="$list" -v typ="$typ" -v q="$fnd" -F"|" '
            function frecent(rank, time) {
                # relate frequency and time
                dx = t - time
                if( dx < 3600 ) return rank * 4
                if( dx < 86400 ) return rank * 2
                if( dx < 604800 ) return rank / 2
                return rank / 4
            }
            function output(files, out, common) {
                # list or return the desired directory
                if( list ) {
                    cmd = "sort -n >&2"
                    for( x in files ) {
                        if( files[x] ) printf "%-10s %s\n", files[x], x | cmd
                    }
                    if( common ) {
                        printf "%-10s %s\n", "common:", common > "/dev/stderr"
                    }
                } else {
                    if( common ) out = common
                    print out
                }
            }
            function common(matches) {
                # find the common root of a list of matches, if it exists
                for( x in matches ) {
                    if( matches[x] && (!short || length(x) < length(short)) ) {
                        short = x
                    }
                }
                if( short == "/" ) return
                # use a copy to escape special characters, as we want to return
                # the original. yeah, this escaping is awful.
                clean_short = short
                gsub(/\[\(\)\[\]\|\]/, "\\\\&", clean_short)
                for( x in matches ) if( matches[x] && x !~ clean_short ) return
                return short
            }
            BEGIN {
                gsub(" ", ".*", q)
                hi_rank = ihi_rank = -9999999999
            }
            {
                if( typ == "rank" ) {
                    rank = $2
                } else if( typ == "recent" ) {
                    rank = $3 - t
                } else rank = frecent($2, $3)
                if( $1 ~ q ) {
                    matches[$1] = rank
                } else if( tolower($1) ~ tolower(q) ) imatches[$1] = rank
                if( matches[$1] && matches[$1] > hi_rank ) {
                    best_match = $1
                    hi_rank = matches[$1]
                } else if( imatches[$1] && imatches[$1] > ihi_rank ) {
                    ibest_match = $1
                    ihi_rank = imatches[$1]
                }
            }
            END {
                # prefer case sensitive
                if( best_match ) {
                    output(matches, best_match, common(matches))
                } else if( ibest_match ) {
                    output(imatches, ibest_match, common(imatches))
                }
            }
        ')" 
		[ $? -gt 0 ] && return
		[ "$cd" ] && cd "$cd"
	fi
}

alias z="_z 2>&1"
