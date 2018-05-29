# first argument is language code

locale -a

sudo locale-gen $1
sudo locale-gen $1.UTF-8
sudo update-locale

locale -a