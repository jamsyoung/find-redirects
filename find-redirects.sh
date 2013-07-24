#!/bin/bash

escape="\033";
green="${escape}[32m";
red="${escape}[31m";
reset="${escape}[0m";

domains=(`cat ./domains.txt`)
paths=(`cat ./paths.txt`)

for domain in ${domains[@]}; do
    for path in ${paths[@]}; do
        for response in `curl -sI ${domain}${path} | grep -E \(HTTP\|Location\) | cut -f2 -d\ `; do
            if [[ ${response} =~ [0-9]+ ]]; then
                if [[ ${response} == 200 ]]; then
                    httpstatus="${green}${response}${reset}"
                    echo -e "${httpstatus}: ${domain}${path}"
                else
                    httpstatus="${red}${response}${reset}"
                fi
            else
                echo -e "${httpstatus}: ${domain}${path} -> ${response}"
            fi
        done
    done
done
