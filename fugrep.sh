#!/bin/bash

declare -a namearray=( $(cat freifunk-karte-data.json | jq -r '.allTheRouters[] | .name | tostring' | fzf -m) )

for n in ${namearray[@]}
do
    name="$(tr -d '"' <<< $n)"
    e="$(cat freifunk-karte-data.json | jq -r ".allTheRouters[] | select(.name == \"$name\") | .name, .community, .status, .clients")"
    echo -e "$e"
done
