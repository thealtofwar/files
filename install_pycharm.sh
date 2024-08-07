#!/bin/bash 
PYCHARM_YEAR="2022" 
PYCHARM_MAJOR="2" 
PYCHARM_MINOR="1" 
while true
do
    echo "Do you want Professional [p] or Community [c]?" 
    read edition 
    if [ "${edition,,}" == "p" ] || [ "${edition,,}" == "professional" ] 
    then 
        echo "Downloading Professional Edition" 
        edition="professional" 
        break
    elif [ "${edition,,}" == "c" ] || [ "${edition,,}" == "community" ] 
    then 
        echo "Downloading Community Edition" 
        edition="community" 
        break
    else
        echo "You didn't put in a valid input. Enter either p or c"
    fi 
done
mkdir ~/Desktop &> /dev/null
[ $? -eq 0 ] && echo "Your desktop directory doesn't seem to exist. It's been created automatically, but PyCharm is graphical, so you'll have to log on to the build server with Remote Desktop Connection to use it"
url="https://download.jetbrains.com/python/pycharm-${edition}-${PYCHARM_YEAR}.${PYCHARM_MAJOR}.${PYCHARM_MINOR}.tar.gz"
curl $url -L -s | tar zxf - -C ~/Desktop
