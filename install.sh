#!/bin/bash
#
# 安裝 xoops-easy-dock
#

# 參考資料：
# menu example => https://askubuntu.com/a/1716
# PS3 => http://benjr.tw/96409
show_menu() {
    printf "\n\n\n"
    echo "*************************"
    echo "   xoops-easy-dock 安裝   "
    echo "*************************"
    printf "\n"

    PS3='請輸入要執行的項目編號：[1-6]  '
    options=("安裝Docker" "準備作業" "設定.env" "設定caddy" "啟動portainer" "離開")
    select opt in "${options[@]}"
    do
        case $opt in
            "安裝Docker")
                echo "**** 安裝 Docker 與 docker-compose ****"
                ./install-docker.sh
                show_menu
                ;;
            "準備作業")
                echo "**** 進行準備作業 ****"
                ./prepare.sh
                show_menu
                ;;
            "設定.env")
                echo "**** 進行 .env 設定 ****"
                ./setup-env.sh
                show_menu
                ;;
            "設定caddy")
                echo "**** 進行 caddy server 設定 ****"
                ./setup-caddy.sh
                show_menu
                ;;
            "啟動portainer")
                echo "**** 啟動 portainer container ****"
                ./run_portainer.sh
                show_menu
                ;;
            "離開")
                printf "\n\n"
                echo "若已完成所有步驟，執行以下指令啟動 container："
                printf "      docker-compose up -d\n\n"
                exit
                ;;
            *) 
                show_menu
                ;;
        esac
    done
}

show_menu
