#!/usr/bin/env bash

update_count=$(checkupdates 2>/dev/null | wc -l)
if [ $update_count -eq 0 ]
then
    echo ''
    exit 0
fi

echo $update_count
