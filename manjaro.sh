# mirror
sudo pacman-mirrors -i -c China -m rank
echo '[archlinuxcn]' >> /etc/pacman.conf
echo 'SigLevel = Optional TrustedOnly' >> /etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
pacman -Syyu
echo Y | pacman -S archlinuxcn-keyring
# grub
# https://www.cnblogs.com/sunilsun/p/6010664.html
grub-mkconfig -o /boot/grub/grub.cfg


# add fctix
echo -e \\n | pacman -S fcitx-im # all
echo Y | pacman -S fcitx-configtool
echo Y | pacman -S fcitx-cloudpinyin
echo 'export GTK_IM_MODULE=fcitx' >> ~/.xprofile # no sudo
echo 'export QT_IM_MODULE=fcitx' >> ~/.xprofile
echo 'export XMODIFIERS="@im=fcitx"' >> ~/.xprofile
# fctix-diagnose


## ide
echo Y | pacman -S visual-studio-code-bin
echo Y | pacman -S clion
echo Y | pacman -S webstorm
echo Y | pacman -S goland
echo Y | pacman -S pycharm-professional
echo Y | pacman -S intellij-idea-ultimate-edition 
echo Y | pacman -S sqlitebrowser
echo Y | pacman -S kitty
yay -S --noconfirm jetbrains-jre
echo 'export CLION_JDK=/usr/lib/jvm/jetbrains-jre' >> ~/.xprofile
echo 'export IDEA_JDK=/usr/lib/jvm/jetbrains-jre' >> ~/.xprofile
echo 'export GOLAND_JDK=/usr/lib/jvm/jetbrains-jre' >> ~/.xprofile
# https://intellij-rust.github.io/

# vim
echo Y | pacman -S vim
echo Y | pacman -S vim-plug
echo Y | pacman -S neovim

## cmd
echo Y | pacman -S exa
echo Y | pacman -S expect
echo Y | pacman -S bat
echo Y | pacman -S xclip
echo Y | pacman -S tmux
echo Y | pacman -S diff-so-fancy 
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
# zsh
echo Y | pacman -S zsh
yay -S --noconfirm oh-my-zsh-git
cd /usr/share/oh-my-zsh
wget https://raw.githubusercontent.com/rupa/z/master/z.sh --no-check-certificate
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/share/oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
git clone https://github.com/zsh-users/zsh-autosuggestions  /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions/


# cmd-tools
echo Y | pacman -S yay
yay -S --noconfirm di # diskinfo
echo Y | pacman -S mlocate
echo Y | pacman -S tcping
echo Y | pacman -S lsof
echo Y | pacman -S s-tui
echo Y | pacman -S sysstat
# trim
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer 
sudo fstrim -v -a
vim /etc/fstab # discard 
# todo ramdisk

## database
yay -S --noconfirm mongodb
# echo Y | pacman -S mongodb-tools
echo Y | pacman -S redis
echo Y | pacman -S mysql
echo Y | pacman -S mycli
echo Y | pacman -S phpmyadmin
yay -S --noconfirm redis-desktop-manager  
## rabbitmq
# https://blog.csdn.net/luckytanggu/article/details/78542700
echo Y | pacman -S rabbitmq
# echo 127.0.0.1 mq >> /etc/hosts
# echo rabbitmq > /etc/hostname
# export HOSTNAME=mq


# cpp
echo Y | pacman -S cmake
echo Y | pacman -S clang
echo Y | pacman -S valgrind
echo Y | pacman -S gdb
yay -S folly --noconfirm
yay -S google-glog --noconfirm
yay -S gflags --noconfirm


# rust
sudo pacman -S rustup
rustup toolchain install stable 
rustup default stable-x86_64-unknown-linux-gnu
# rust 
mkdir ~/.cargo
tee ~/.cargo/config <<EOF
[source.crates-io]
registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'ustc'
[source.ustc]
registry = "git://mirrors.ustc.edu.cn/crates.io-index"
EOF


## anaconda
echo Y | pacman -S anaconda
export PATH=/opt/anaconda/bin:$PATH
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/
conda config --set show_channel_urls yes 
# echo Y | pacman -S opencv
# echo Y | pacman -S cuda
# echo Y | pacman -S cudnn


## go 
echo Y | pacman -S go
export GOPATH=~/go  
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

## nodejs
echo Y | pacman -S nodejs
echo Y | pacman -S npm

## java
echo Y | pacman -S jdk11-openjdk


# software
echo y | pacman -S baobab
echo y | pacman -S bleachbit
yay -S --noconfirm electron-ssr 
yay -S --noconfirm iptux 
echo Y | pacman -S chromium
echo Y | pacman -S typora
echo Y | pacman -S pandoc
#echo Y | pacman -S netease-cloud-music todo
#echo Y | pacman -S teamviewer todo
echo Y | pacman -S telegram-desktop
yay -S google-earth-pro --noconfirm
echo Y | pacman -S wireshark-qt
echo Y | pacman -S tusk
yay -S --noconfirm fsearch-git 
yay -S --noconfirm deepin-wine-wechat 
yay -S --noconfirm deepin-wxwork
echo Y | pacman -S ttf-fira-code ttf-sarasa-gothic
echo Y | pacman -S zip unzip file-roller
yay -S --noconfirm dpkg
yay -S --noconfirm rclone-browser # https://zoi.red/archives/52.html


## bluetooth
pacman -S xorg-xinput
pacman -S blueman
yay -S --noconfirm evhz
## manjaro nvidia driver
# https://amazingrise.github.io/2019/04/20/Manjaro-Optimus-Dual-Monitor/#%E8%A7%A3%E5%86%B3%E6%96%B9%E6%B3%95


# deepin
# https://www.jianshu.com/p/a1e31a9a50dc
# todo bash replace string in file
echo -e \\n | pacman -S deepin
echo Y | pacman -S deepin.com.qq.im
echo Y | pacman -S deepin-screenshot
echo Y | pacman -Rsc plasma
echo Y | pacman -Rsc kde-applications
echo Y | pacman -R thunderbird
echo Y | pacman -Rs xterm
echo Y | pacman -Rs calligra
echo Y | pacman -S libreoffice-fresh

pacman -S virtualbox # by linux kernel # uname -a


# docker
echo Y | pacman -S docker docker-composel
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker lhy1024
#todo
yay -S nvidia-container --noconfirm # only #don't install nvidia-docker
{\"registry-mirrors\": [\"https://docker.mirrors.ustc.edu.cn\"]}  /etc/docker/daemon.json # ?


sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker


## todo
# mhwd cmd todo
# timezone cmd todo
# zoho  outlook calender
# win+<- win+->
# vscode config
# Trackpad gesture


# sudo docker run -it --runtime nvidia -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/lhy/no4:/share --network=host --name 444 nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04 bash 
# # https://lug.ustc.edu.cn/wiki/mirrors/help/ubuntu
# sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
# apt-get update
# echo Y | apt install libxext6
# echo Y | apt install libxrender1
# echo Y | apt install libxtst6
# echo Y | apt install libxi6
# echo Y | apt install libfreetype6
# echo Y | apt install mlocate
# echo Y | apt install wget
# echo Y | apt install xauth
# echo Y | apt install unzip
# echo Y | apt install git
# echo Y | apt install vim
# echo Y | apt install libgmp-dev
# echo Y | apt install libmpfr-dev
# echo Y | apt install libmpc-dev
# echo Y | apt install libssl-dev
# echo Y | apt install sudo
# echo Y | apt install cmake
# apt-get install zsh git tmux vim wget mlocate cmake clang
# apt-get install language-pack-zh-hans
# https://blog.csdn.net/zhangchao19890805/article/details/52743380
# export LANG="zh_CN.UTF-8"
# export LC_ALL="zh_CN.UTF-8"
# echo Y | apt install mongodb
# echo Y | apt install cmake
# # xauth add lhy-pc/unix:0  MIT-MAGIC-COOKIE-1  ed956cc3f4717096b76920cbc1c4df2a

# # ./contrib/download_prerequisites
# cd ..

# mkdir build

# cd build

# ../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib

# make -j4

# make install

# apt install gdb

# cd /tmp
# wget http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc
# apt-key add erlang_solutions.asc
# apt-get update
# echo y | apt-get install erlang
# echo y | apt-get install erlang-nox
# echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
# cd /tmp
# wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
# apt-key add rabbitmq-signing-key-public.asc
# apt-get update
# echo y |apt-get install rabbitmq-server

# docker commit -p bd13e7ebb93c container-backup


# mkdir ~/.vim/autoload/
# cd ~/.vim/autoload/
# wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# apt-get install zsh git tmux vim wget mlocate cmake clang
