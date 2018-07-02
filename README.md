# ~/

My personal dotfiles.

``` text
                            
                   -`                    anler@cygnus 
                  .o+`                   ------------ 
                 `ooo/                   OS: Arch Linux x86_64 
                `+oooo:                  Host: 20L5CTO1WW ThinkPad T480 
               `+oooooo:                 Kernel: 4.17.3-1-ARCH 
               -+oooooo+:                Uptime: 10 mins 
             `/:-:++oooo+:               Packages: 770 (pacman), 2 (nix) 
            `/++++/+++++++:              Shell: zsh 5.5.1 
           `/++++++++++++++:             Resolution: 1920x1080 
          `/+++ooooooooooooo/`           WM: i3 
         ./ooosssso++osssssso+`          Theme: Vertex-Dark [GTK2/3] 
        .oossssso-````/ossssss+`         Icons: Vertex-Icons [GTK2/3] 
       -osssssso.      :ssssssso.        Terminal: urxvt 
      :osssssss/        osssso+++.       Terminal Font: Fantasque Sans Mono 
     /ossssssss/        +ssssooo/-       CPU: Intel i7-8550U (8) @ 4.000GHz 
   `/ossssso+/:-        -:/+osssso+-     GPU: Intel UHD Graphics 620 
  `+sso+:-`                 `.-/+oso:    Memory: 954MiB / 15805MiB 
 `++:.                           `-/+/
 .`                                 `/                           
```

![](https://raw.githubusercontent.com/anler/dotfiles/master/images/desktop.jpg)
![](https://raw.githubusercontent.com/anler/dotfiles/master/images/desktop2.jpg)
![](https://raw.githubusercontent.com/anler/dotfiles/master/images/desktop3.jpg)

![](https://raw.githubusercontent.com/anler/dotfiles/master/images/keyboard.jpg)

## installation

I use [Gnu Stow](https://www.gnu.org/software/stow/) to manage the dotfiles.

``` shell
git clone git@github.com:anler/dotfiles.git
cd dotfiles
stow --target=$HOME .
```

## license

[MIT](http://opensource.org/licenses/MIT)
