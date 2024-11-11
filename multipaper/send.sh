#!/usr/bin/env bash

VPS="root@159.203.73.170"

scp -r ~/.cloudflared/ "$VPS":/root/.cloudflared
scp minecraft.service "$VPS":/usr/lib/systemd/system/
ssh "$VPS" systemctl enable --now minecraft.service
