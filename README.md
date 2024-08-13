# Configs ⚙️

| Name               | Description                                                                             |
| ------------------ | --------------------------------------------------------------------------------------- |
| **Editor**         | Neovim with my [config](https://github.com/volskaya/neovim-config) ✏️.                  |
| **Shell**          | [Fish](https://fishshell.com/) shell with [starship](https://starship.rs/) prompt 🐟🚀. |
| **Palette**        | Colors from [Irrelevant](https://github.com/volskaya/irrelevant) 🎨.                    |
| **Fonts**          | Recursive Mono Casual, with italics from Cartograph CF & Nerd Font symbols 🖋️.          |
| **Window Manager** | Semi tiled & float setup with [yabai](https://github.com/koekeishiya/yabai) 🪟.         |
| **File Manager**   | Terminal based file manager - [ranger](https://github.com/ranger/ranger) 📁.            |
| **Terminal**       | WezTerm. 🖥️.                                                                            |

## Installation 🛠️

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/dotfiles.git && cd dotfiles
   ```

2. **Install dependencies**:

   - Ensure you have Homebrew installed. If not, install it from [here](https://brew.sh/) 🍺.
   - Install the necessary tools:
     ```sh
     brew install wezterm fish ranger yabai mpv starship taskell
     ```

3. **Set up the font**:

   My wezterm is configured to use `Recursive Mono Casual` for regular & a patched `CartographCF` for italics. You can use any font you like, but you'll have to change the font settings in `.config/wezterm/font.lua`.

   I can't share `CartographCF` since it's a paid font.

   But `Maple Mono` is an excellent alternative that I've used a lot. I wouldn't recommend using `Recursive Mono Casual` if you can't pair it with `CartographCF`.

   - Install the fonts from the `fonts` directory:

4. **Apply the configurations**:

   - Symlink the dotfiles you wish to use to your home directory, like:
     ```sh
     ln -s dotfiles/wezterm ~/.wezterm
     ln -s dotfiles/nvim ~/.config/nvim
     ```

5. **Install neovim**:

   - Download the latest Neovim release for macOS from the [Neovim GitHub releases page](https://github.com/neovim/neovim/releases) 📦.
   - Extract the downloaded archive and move it to the desired location:
     ```sh
     tar xzvf nvim-macos-arm64.tar.gz && mv nvim-macos-arm64 ~/.nvim-macos
     ```

6. **Ready to go**:

   Open WezTerm and you're ready to go! 🚀
