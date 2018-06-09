# ~/

My personal dotfiles.

``` text
                            
██████████████████  ████████   anler@cygnus 
██████████████████  ████████   ------------ 
██████████████████  ████████   OS: Manjaro Linux x86_64 
██████████████████  ████████   Host: 20L5CTO1WW ThinkPad T480 
████████            ████████   Kernel: 4.14.47-1-MANJARO 
████████  ████████  ████████   Uptime: 6 hours, 12 mins 
████████  ████████  ████████   Packages: 1379 
████████  ████████  ████████   Shell: zsh 5.5.1 
████████  ████████  ████████   Resolution: 1920x1080 
████████  ████████  ████████   WM: i3 
████████  ████████  ████████   Theme: Arc-Breath-Dark [GTK2/3] 
████████  ████████  ████████   Icons: Faba [GTK2/3] 
████████  ████████  ████████   Terminal: urxvt 
████████  ████████  ████████   Terminal Font: Fantasque Sans Mono 
                               CPU: Intel i7-8550U (8) @ 4.000GHz 
                               GPU: Intel UHD Graphics 620 
                               Memory: 3043MiB / 15806MiB 

                                                       
```

![](https://raw.githubusercontent.com/anler/dotfiles/master/images/desktop.jpg)

![](https://raw.githubusercontent.com/anler/dotfiles/master/images/laptop.jpg)

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
