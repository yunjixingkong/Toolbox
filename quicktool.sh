#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 {APP_ID} {CONFIG_FILE}"
    exit 1
fi

basepath=$(cd `dirname $0`; pwd)
conffile=$basepath/quicktool.txt

setenv(){
    os=$(uname)
    if [ $os = "Linux" ]
    then
        os="linux"
    fi

    if [ $os = "Darwin" ]
    then
        os="darwin"
    fi

    PATH=$PATH:$basepath/bin/pssh/${os}:$basepath/bin/yaml/${os}
}

main(){
    local cmd=$1

    setenv

    while read line
    do
        if [[ $line =~ ^$ || $line =~ ^#.* ]]
        then
            continue
        fi

        echo $line

        config=(${line// / })
        echo ${config[0]}
        if [ $cmd != ${config[0]} ]
        then
            continue
        fi
        echo ${config[1]}
        echo ${config[2]}
        cmd=${config[2]//;/ }
        echo $cmd
        pssh -H ${config[1]} -i $cmd
    done <$conffile
}

main $@
