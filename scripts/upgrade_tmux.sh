apt install -y libevent-dev ncurses-dev build-essential bison pkg-config
curl -L https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz -O
tar -zxf tmux-3.3a.tar.gz
cd tmux-3.3a
./configure
make && make install
