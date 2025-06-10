#!/bin/bash

start_date_unix=0
end_date_unix=$(date -u +%s)

current_date_unix=$start_date_unix
while [ "$current_date_unix" -le "$end_date_unix" ]; do
    commit_date=$(date -u -d "@$current_date_unix" +"%Y-%m-%d %H:%M:%S")

    git commit --allow-empty -m "Daily streak commit for $commit_date" --date "$commit_date"

    if [ $? -ne 0 ]; then
        sleep 5
        continue
    fi

    current_date_unix=$((current_date_unix + 86400))
done
