#!/usr/bin/env bash

N=1

# TODO
docker compose scale master=1 paperclip="$N"
