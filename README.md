# THIS IS A WORK IN PROGRESS!
As of now, this is not suitable for full-time use. More configs will be added, including propper documentation and dependencies. Feel free to start using this if you feel like it!

> [!NOTE]
> This is the config **I use on my own system**. It is not intended to be used broadwise and, while I try to make everything not break suddenly, some things may not run as expected in your machine.

# Dotfiles
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png" width=20 style="transform: translateY(20%)">&nbsp; Currently using for [Fedora](https://fedoraproject.org/).

###### [Hyprland](https://hyprland.org/) · [Swaybar](https://github.com/Alexays/Waybar) · [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) · [Neovim](https://neovim.io/) · [Kitty](https://sw.kovidgoyal.net/kitty/)


## Dependencies

Make sure to get yourself a [NerdFont](https://www.nerdfonts.com/). (I use `JetBrains Mono` in this config, you can choose your own, though it may need some changes in CSS files)

You can install binary dependencies by running the following command:
```
$ dnf install stow git ImageMagick
```

## How to install

Clone the repository in your `$HOME` directory using git
```bash
$ git clone https://github.com/MarcioSobel/dotfiles
$ cd dotfiles
```
Run [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks
```bash
$ stow .
```
If you get an error, this means some config files already exists in your system. You can ignore them, or backup your files and run the stow command again. You can also merge the symlinks in the directory using the `--adopt` argument. This will make sure your files will be prioritized, while the ones that doesn't exist will be created.

And done! You should be able to log in Hyprland and start using this config. Feel free to remove the `.git` repository, or keep it if you want to create your own repo or update from here!
