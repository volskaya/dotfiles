from pathlib import Path
from shutil import copytree, copyfile, rmtree

path = Path(__file__)
project_path = path.parent.parent
dotfiles_path = project_path / "dotfiles"

home_path = Path.home()
application_support_path = home_path / "Library" / "Application Support"
config_path = home_path / ".config"
home_bin_path = home_path / ".bin"

relevant_paths = [
    config_path / "alacritty",
    config_path / "fish",
    config_path / "htop",
    config_path / "mpv",
    config_path / "neovide",
    config_path / "nvim",  # Already included as a git module.
    config_path / "ranger",
    config_path / "snippets",
    config_path / "taskell",
    config_path / "wezterm",
    config_path / "yabai",
    config_path / "starship.toml",

    home_bin_path,

    home_path / ".bashrc",
    home_path / ".zshrc",
    home_path / ".skhdrc",
    home_path / ".swiftformat",
    home_path / ".tmux.conf",

    application_support_path / "lazygit" / 'config.yml',
    # application_support_path / "Code" / 'User' / 'Snippets',
    # application_support_path / "Code" / 'User' / 'keybindings.json',
    # application_support_path / "Code" / 'User' / 'settings.json',
]

placehold_paths = [
    home_path / ".emacs.d",
    home_path / ".nvim-macos",
]

rmtree(dotfiles_path, ignore_errors=True)
dotfiles_path.mkdir(parents=True, exist_ok=True)
print("Copying dotfiles from", config_path)

# Copy the dotfiles to the parent directory of this script.
for relevant_path in relevant_paths:
    relative_path = relevant_path.relative_to(home_path)
    target_path = dotfiles_path / relative_path

    if not relevant_path.exists():
        print(relevant_path, "does not exist.")
    elif relevant_path.is_dir():
        copytree(relevant_path, target_path)
    else:
        target_path.parent.mkdir(parents=True, exist_ok=True)
        copyfile(relevant_path, target_path)
