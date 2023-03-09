set -l release lsb_release -sc
sudo echo "deb https://nginx.org/packages/ubuntu/ $release nginx" >> /etc/apt/sources.list
sudo echo "deb-src https://nginx.org/packages/ubuntu/ $release nginx" >> /etc/apt/sources.list

set -l key (sudo apt update 2> /dev/null | grep NO_PUBKEY | sed 's/.*NO_PUBKEY //g')
if not test -z $key
   sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
   sudo apt update
end
sudo apt install nginx
