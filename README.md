# THIS IS A WORK IN PROGRESS!
As of now, this is not suitable for full-time use. More configs will be added, including propper documentation and dependencies. Feel free to start using this if you feel like it!

> [!NOTE]
> This is the config **I use on my own system**. It is not intended to be used broadwise and, while I try to make everything not break suddenly, some things may not run as expected in your machine.

# Dotfiles
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png" width=20 style="transform: translateY(20%)">&nbsp; Currently using for [Fedora](https://fedoraproject.org/).

###### [Hyprland](https://hyprland.org/) · [Waybar](https://github.com/Alexays/Waybar) · [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) · [Neovim](https://neovim.io/) · [Kitty](https://sw.kovidgoyal.net/kitty/)

### Quick go-to
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Mappings](#mappings)

## Dependencies

Make sure to get yourself a [NerdFont](https://www.nerdfonts.com/). (I use `JetBrains Mono` in this config, you can choose your own, though it may need some changes in CSS files)

Enable [soloplasha's COPR](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland):
```
$ dnf copr enable solopasha/hyprland
```

Install binary dependencies by running the following command:
```
$ dnf install stow git kitty hyprland btop grimblast hyprpaper waybar SwayNotificationCenter ImageMagick
```

## Installation

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

## Mappings
<details>
<summary>Hyprland keybindings</summary>

| Keybind | Description |
| :--- | :--- |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Open terminal (kitty) |
| <kbd>Super</kbd> + <kbd>R</kbd> | Open Launcher |
| <kbd>Super</kbd> + <kbd>E</kbd> | Open file explorer |
| <kbd>Super</kbd> + <kbd>C</kbd> | Close window |
| <kbd>Super</kbd> + <kbd>M</kbd> | Log out |
| <kbd>Super</kbd> + <kbd>🖰 LMB</kbd> | Move window |
| <kbd>Super</kbd> + <kbd>🖰 RMB</kbd> | Resize window |
| <kbd>Super</kbd> + <kbd>🖰 Scroll</kbd> | Change workspace |
| <kbd>Super</kbd> + <kbd>[1-0]</kbd> | Go to workspace [1-10] |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>[1-0]</kbd> | Move active window to workspace [1-10] |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>Esc</kbd> | Open btop |
| <kbd>Prtscrn</kbd> | Select area to print and copy to clipboard |
| <kbd>Super</kbd> + <kbd>V</kbd> | Toggle floating window |
| <kbd>Super</kbd> + <kbd>P</kbd> | Toggle pseudo tiling |
| <kbd>Super</kbd> + <kbd>J</kbd> | Toggle window arragement (vertical/horizontal) |
| <kbd>Super</kbd> + <kbd>⇥ Tab</kbd> | Change window focus |
| <kbd>Super</kbd> + <kbd>←</kbd> | Focus left window |
| <kbd>Super</kbd> + <kbd>→</kbd> | Focus right window |
| <kbd>Super</kbd> + <kbd>↑</kbd> | Focus upper window |
| <kbd>Super</kbd> + <kbd>↓</kbd> | Focus lower window |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>←</kbd> | Move window left |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>→</kbd> | Move window right |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>↑</kbd> | Move window up |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>↓</kbd> | Move window down |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>H</kbd> | Move window left |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>L</kbd> | Move window right |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>K</kbd> | Move window up |
| <kbd>Super</kbd> + <kbd>⇧ Shift</kbd> + <kbd>J</kbd> | Move window down |
</details>

<details>
<summary>Neovim keybindings</summary>

> Note: The `leader key` set for Neovim in this config is <kbd>␣ Space</kbd> 

> Note: If you press `<leader>`, a popup showing available keybinds should appear.

| Keybind | Description |
| :--- | :--- |
| <kbd>Leader</kbd> + <kbd>e</kbd> | Toggle File Explorer |
| <kbd>Ctrl</kbd> + <kbd>n</kbd> | Focus File Explorer |
| <kbd>Leader</kbd> + <kbd>p</kbd> | Paste without overwritting current buffer |
| <kbd>Leader</kbd> + <kbd>d</kbd> | Delete without overwritting current buffer |
| <kbd>Leader</kbd> + <kbd>y</kbd> | Copy to system clipboard |
| <kbd>Leader</kbd> + <kbd>Y</kbd> | Copy to system clipboard |
| <kbd>Leader</kbd> + <kbd>/</kbd> | Comment line (broken?) |
| <kbd>Leader</kbd> + <kbd>s</kbd> + <kbd>p</kbd> + <kbd>v</kbd> | Split window vertically |
| <kbd>Leader</kbd> + <kbd>s</kbd> + <kbd>p</kbd> + <kbd>h</kbd> | Split window horizontally |
| <kbd>Leader</kbd> + <kbd>f</kbd> + <kbd>f</kbd> | Find files |
| <kbd>Leader</kbd> + <kbd>f</kbd> + <kbd>a</kbd> | Find all files (including hidden and ignored by git) |
| <kbd>Leader</kbd> + <kbd>f</kbd> + <kbd>b</kbd> | Find buffer |
| <kbd>Leader</kbd> + <kbd>f</kbd> + <kbd>d</kbd> | LSP Diagnostics |
| <kbd>Leader</kbd> + <kbd>g</kbd> + <kbd>b</kbd> | Git blame line |
| <kbd>Leader</kbd> + <kbd>g</kbd> + <kbd>s</kbd> | Show git status |
| <kbd>Leader</kbd> + <kbd>g</kbd> + <kbd>c</kbd> + <kbd>b</kbd> | Show git branches |
| <kbd>⇥ Tab</kbd> | Go to next buffer |
| <kbd>⇧ Shift</kbd> + <kbd>⇥ Tab</kbd> | Go to previous buffer |
| <kbd>Leader</kbd> + <kbd>x</kbd> | Close current buffer |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | Save buffer |
| <kbd>Leader</kbd> + <kbd>m</kbd> + <kbd>d</kbd> + <kbd>p</kbd> | Toggle markdown preview |
</details>
