
# artix-dots
## (don't skip the readme if you wanna try these out)

These are the dotfiles for my artix laptop.

This is a work in progress,as I am still learning lua (at least in this scope).
Feel free to open any issues if you see something off or incorrect.

## Bootstrapping/Installation

These dotfiles are managed with [dotdrop](https://github.com/deadc0de6/dotdrop).
If you wanna give these dots a try or want to contribute clone this repo:
```
$ git clone https://github.com/Theory-of-Everything/artix-dots
$ cd artix-dots
```
Update the submodules:
```
$ git submodule update --recursive
```
Install the dots (NOTE: This will overwite exsisting dotfiles)
```
$ ./dotdrop.sh install artix
```

### Images:
![Blank Destop](/images/rev1/desktop.png)

![Terminal Apps](/images/rev1/termapps.png)

### Keybinds:
#### Window/Workspace Manipultion:
- <kbd> Mod </kbd>+<kbd> Enter </kbd>: Opens Terminal
- <kbd> Mod </kbd>+<kbd> Q </kbd>: Open App Launcher 
- <kbd> Mod </kbd>+<kbd> W </kbd>: Close/Kill Window 
- <kbd> Mod </kbd>+<kbd> H </kbd> / <kbd> J </kbd>: Focus Up/Down Stack
- <kbd> Mod </kbd>+<kbd> E </kbd>: Pull Window to Master Node 
- <kbd> Mod </kbd>+<kbd> [ </kbd> / <kbd> ] </kbd>: Previous/Next Tag/Workspace


### Packages:
#### Interface:
- Distro: `Artix Linux`
- WM: `AwesomeWM`
- DM: `lighdm`
- Compositor: `ibhagwan/picom`
- Wallpaper Manager: `nitrogen`
- Launcher: `rofi`

#### Term/Editor
- Terminal: `rxvt-unicode`
- Term Editor: `neovim-nightly`
- IDE/Text Editor: `vscode - oss`

#### Other Stuff:

- File Manger: `Thunar`
- Fonts/Icons: `agave Nerd Font`
- Feed Reader: `newsboat`
- Screenshot Tool: `maim`
- gtk Theme: `Yaru-Colors Green`
- term theme: `custom`


