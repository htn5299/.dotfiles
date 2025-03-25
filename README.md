## dotfiles

### shell

```sh
pacman -S zsh
chsh -s $(which zsh)
hyprctl dispatch exit
echo $SHELL
$SHELL --version
```

### browser

```sh
sudo pacman -S firefox
```

### yay

```sh
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

### networkmanager

```sh
sudo pacman -S networkmanager network-manager-applet
sudo systemctl enable --now NetworkManager
```

### bluetooth

```
sudo pacman -S bluez bluez-utils
sudo systemctl enable --now bluetooth.service
sudo pacman -S blueman
```

### library

```sh
sudo pacman -Syu
sudo pacman -S playerctl brightnessctl pavucontrol
sudo pacman -S cliphist wl-clipboard

sudo pacman -S ttf-nerd-fonts-symbols-mono ttf-jetbrains-mono-nerd ttf-font-awesome ttf-ubuntu-nerd
yay -S ttf-hackgen

sudo pacman -S fzf ripgrep ghostty mpv tmux zoxide stow chafa yazi ffmpegthumbnailer p7zip jq poppler fd imagemagick trash-cli unzip cargo neovim vim
yay -S oh-my-posh
```

### gpu open source

```sh
sudo pacman -S intel-media-driver mesa xf86-video-amdgpu xf86-video-vmware libva-intel-driver vulkan-intel xf86-video-ati xorg-server libva-mesa-driver vulkan-radeon xf86-video-nouveau xorg-xinit
```

### hyprland

```sh
sudo pacman -S rofi-wayland hyprpicker hyprlock hypridle waybar dunst nautilus okular loupe
yay -S swww waypaper-git hyprshot
sudo pacman -Syu xdg-desktop-portal-hyprland xdg-desktop-portal-kde xdg-desktop-portal-gtk qt5-wayland qt6-wayland
# sudo pacman -S polkit-kde-agent
sudo pacman -S hyprpolkitagent

sudo pacman -S qt6ct kvantum nwg-look nwg-displays dconf-editor
# sudo pacman -S gnome-themes-extra gtk-engine-murrine sassc
sudo pacman -S adw-gtk-theme arc-icon-theme xcursor-vanilla-dmz
```

- Qt theme [KvLibadwaita](https://github.com/GabePoel/KvLibadwaita)

### ssh git

```sh
ls -al ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub | wl-copy

git config --global user.name "Example Name"
git config --global user.email example@example.com
```

- Add SSH keys [Github](https://github.com/settings/keys)

### stow

```sh
cd ~/.dotfiles
stow . --adopt -nv
stow . --adopt -v
git reset --hard HEAD
```

### node version manager

- Install nvm [nvm-sh/nvm](https://github.com/nvm-sh/nvm)

```sh
command -v nvm
nvm install node
```

### tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux source ~/.tmux.conf
# ctrl+a I
```
