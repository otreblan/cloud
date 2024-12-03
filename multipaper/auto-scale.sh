#/usr/bin/env bash

MIN_N=1

N=$(docker compose stats --no-stream --format json | jq '. | select(.Name | contains("multipaper-paperclip-")) | .CPUPerc | sub("%"; "") | tonumber? | select(. >= 100)' | jq -s ". | length")
docker compose scale master=1 paperclip=$((MIN_N>N ? MIN_N : N))
