
set -l key (unminimize 2> /dev/null | grep NO_PUBKEY | sed 's/.*NO_PUBKEY //g')
if not test -z $key
   sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $key
   sudo apt update
end
unminimize