alias cloudflare-warp = exec sudo ~/Apps/warp/daemon
alias jupyter-lab2 = jupyter-lab --FileCheckpoints.checkpoint_dir=/tmp/
alias kmon2 = sudo kmon -a 00FFFF -c FF00FF -t 1000
alias ll = ls
alias ncmpcpp2 = ncmpcpp -c ~/.config/mpd/ncmpcpp.conf
alias sublime-text = ~/Apps/sublime_text/sublime_text
alias turbostat2 = sudo turbostat -i 2 -s CPU,Avg_MHz,PkgTmp,PkgWatt
alias vi = /bin/helix

def config-collector [] {
  cd ~/Temporary/
  mkdir ./config/
  for i in [
    $"($nu.home-path)/.config/alacritty.yml"
    $"($nu.home-path)/.config/bottom/bottom.toml"
    $"($nu.home-path)/.config/helix/config.toml"
    $"($nu.home-path)/.config/helix/themes/blood.toml"
    $"($nu.home-path)/.config/mimeapps.list"
    $"($nu.home-path)/.config/mpd/mpd.conf"
    $"($nu.home-path)/.config/mpd/ncmpcpp.conf"
    $"($nu.home-path)/.config/nushell/config.nu"
    $"($nu.home-path)/.config/nushell/env.nu"
    $"($nu.home-path)/.config/sublime-text/Packages/User/Preferences.sublime-settings"
    $"($nu.home-path)/.config/sway/bar.json"
    $"($nu.home-path)/.config/sway/config"
    $"($nu.home-path)/.config/sway/style.css"
    $"($nu.home-path)/.gitconfig"
    $"($nu.home-path)/.local/share/kxmlgui5/dolphin/dolphinui.rc"
    $"($nu.home-path)/.rustup/settings.toml"
    $"($nu.home-path)/.ssh/id_rsa"
    $"($nu.home-path)/.ssh/id_rsa.pub"
    $"($nu.home-path)/Apps/functions.sh"
    $"($nu.home-path)/Temporary/.directory"
    $"($nu.home-path)/Text/alan.txt"
    $"($nu.home-path)/Text/list.txt"
    $"($nu.home-path)/Text/mail.txt"
    $"($nu.home-path)/Text/want.txt"
    $"/etc/pacman.conf"
    $"/etc/pacman.d/mirrorlist"
    $"/usr/share/applications/pycharm.desktop"
    $"/usr/share/applications/sublime-text.desktop"
  ] {
    cp $i ./config/
  }
  pacman -Qeq | save -rf ./config/pacman.list
  try {
    rm ./config.zip
  }
  /bin/zip -r ./config.zip ./config/
  rm -r ./config/
}

def decompressor [argv] {
  if ($"($argv)" | split words | last) == "zip" {
    unzip $argv
  } else {
    tar -xf $argv
  }
}

def git-log [] {
  git status --short
  git log --max-count 8 --oneline
}

def git-sync [argv] {
  git add .
  git commit -m $argv
  git push
}

def plasma-implementation [] {
  echo "[Icon Theme]" "Inherits=Breeze_Snow" | save -r ./tmp; sudo cp ./tmp /usr/share/icons/default/index.theme; rm ./tmp
  gsettings set org.gnome.desktop.interface cursor-theme Breeze_Snow
  gsettings set org.gnome.desktop.interface gtk-theme Breeze
  gsettings set org.gnome.desktop.interface icon-theme breeze
}

def sh2 [argv] {
  bash -c $"source ~/Text/lab/venv/bin/activate && ($argv)"
}

if (tty) == "/dev/tty1" {
  exec sway
}
