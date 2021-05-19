
# artix-dots (dont skip)
## The goal

The rationale behind these dots are to be as Keyboard-centric as possible, elimainating mouse use as much as possible. However, these dots are also designed to be usable in a more traditional stacking style of wm. Versatility is key. Another key point is performace, as I want as much resources possible avalible to apps that actually need it, not to my wm.

These dots are a work in progress, so expect thing to not work or not be present.

Also note: Caps Lock is rebound to the Escape key (because capslock is useless)

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

## Images:
![Blank Destop](/images/rev1/desktop.png)

![Terminal Apps](/images/rev1/termapps.png)

## Keybinds:
#### Window Manipultion:
- <kbd> Mod </kbd> + <kbd> W </kbd> : Close/Kill Window 
- <kbd> Mod </kbd> + <kbd> H </kbd> / <kbd> J </kbd> : Focus Up/Down Stack
- <kbd> Mod </kbd> + <kbd> H </kbd> / <kbd> L </kbd> : Master Node Width Left/Right
- <kbd> Mod </kbd> + <kbd> E </kbd> : Pull Window to Master Node 


#### Tag Manipulation
- <kbd> Mod </kbd> + <kbd> [ </kbd> / <kbd> ] </kbd> : Previous/Next Tag/Workspace
- <kbd> Mod </kbd> + <kbd> 1 </kbd> - <kbd> 9 </kbd> : Switch to Tag 1-9
- <kbd> Ctrl </kbd> + <kbd> Mod </kbd> + <kbd> 1 </kbd> - <kbd> 9 </kbd> : Pull Windows from Tags 1-9
- <kbd> Shift </kbd> + <kbd> Mod </kbd> + <kbd> 1 </kbd> - <kbd> 9 </kbd> : Send Windows to Tags 1-9

#### App Binds
- <kbd> Mod </kbd> + <kbd> Enter </kbd> : Opens Terminal
- <kbd> Mod </kbd> + <kbd> Q </kbd> : Open App Launcher
- <kbd> Mod </kbd> + <kbd> A </kbd> : AwesomeWM Menu
- <kbd> F12 </kbd> : Open Dropdown Terminal
- <kbd> F11 </kbd> : Open Dropdown Task Manager (htop)

#### Other
- <kbd> Shift </kbd> + <kbd> Mod </kbd> + <kbd> s </kbd> : Take Selection Screenshot
- <kbd> Print </kbd> : Take Screenshot

## Packages:
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

#### General-Use Apps:

- File Manger: `Thunar`
- Feed Reader: `newsboat`
- Video Player `mpv`
- Doc Veiwer: `zathura`
- Screenshot Tool: `maim`

#### Themes/Fonts:

- gtk Theme: `Yaru-Colors Green`
- term theme: `custom Xresources`
- term font: `agave Nerd Font`
- bar font: `cozette Bitmap` (Probably scentifica soon lamo)


