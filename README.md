# dotfiles

My personal dotfiles.

``` tex

                  ##			OS: Arch Linux x86_64
                 ####			Hostname: cygnus
                ######			Uptime: 5:56, 22 sec
               ########			Kernel: 4.14.47-1-MANJARO
              ##########		Shell: /usr/bin/zsh
             ############		Packages: 1357
            ##############		WM: i3
           ################		GTK2 theme: Vertex-Dark
          ##################		GTK2 icon theme: Adwaita
         ####################		GTK2 font name: Cantarell 11
        ######################		RAM: 4541M / 15806M (28%)
       #########      #########		CPU: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz
      ##########      ##########	Efi: 28M / 256M (11%) (vfat)
     ###########      ###########	Root: 30G / 83G (38%) (ext4)
    ##########          ##########	
   #######                  #######	
  ####                          ####	
 ###                              ###	

```

![](https://raw.githubusercontent.com/anler/dotfiles/master/images/desktop.jpg)

## installation

I use [Gnu Stow](https://www.gnu.org/software/stow/) to manage the dotfiles.

``` shell
git clone git@github.com:anler/dotfiles.git
cd dotfiles
stow --target=$HOME .
```

## license

[MIT](http://opensource.org/licenses/MIT)
