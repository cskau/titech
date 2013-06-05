#!/usr/bin/bash

# script for automatically logging on to titech-pubnet

USER=12M12345
PASS=yourPass

wget -O /dev/null "http://173.194.38.110/generate_204"
wget -O /dev/null --post-data="username=$USER&password=$PASS&buttonClicked=4&redirect_url&err_flag=0&Submit=同意して利用" "https://wlanauth.noc.titech.ac.jp/login.html"
