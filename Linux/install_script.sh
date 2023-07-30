#Install development Stuff
sudo pacman -Syu
pacman -S obsidian go yay brave-browser --noconfirm

#Install Flutter
DIR="flutter-download"
VER="3.10.6-stable"
FILE="flutter_linux_$VER.tar.xz"
# [ ! -d "${DIR}" ] && mkdir -p "$DIR";
# cd flutter-download
# if [ ! -f "$FILE" ]; then
#   echo "Downloading"
#   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/$FILE
# fi
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/$FILE
tar xf flutter_linux_3.10.6-stable.tar.xz --directory ~
export PATH="$PATH:/home/avendo/flutter/bin" >> ~/.zshrc
source .zshrc

pacman -S base-devel
pacman -S cmake
pacman -S ninja

#Install Nvidia Drivers
pacman -S linux-headers nvidia --noconfirm

#lightly-theme
sudo pacman -S cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras
git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
cd Lightly && mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
make
sudo make install

# https://stackoverflow.com/questions/7642674/how-do-i-script-a-yes-response-for-installing-programs
