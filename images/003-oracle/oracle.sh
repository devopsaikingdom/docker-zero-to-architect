#!/bin/sh
sayings="Ship it. | Cache is king. | Logs never lie. | One process, one container. | Pin your versions."
line=$(echo "$sayings" | tr '|' '\n' | shuf -n 1)
figlet "$line"
