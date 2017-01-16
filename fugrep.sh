#!/bin/bash

freifunk="$(curl https://api.freifunk.net/data/freifunk-karte-data.json)"

declare -a namearray=( $(echo "$freifunk" | jq -r '.allTheRouters[] | .name | tostring' | fzf -m) )

for n in ${namearray[@]}
do
    name="$(tr -d '"' <<< $n)"
    e="$(echo "$freifunk" | jq -r ".allTheRouters[] | select(.name == \"$name\") | .name, .community, .status, .clients")"
    echo -e "$e"
done
