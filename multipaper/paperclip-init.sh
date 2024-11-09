#!/usr/bin/env sh

java \
	-jar \
	--add-modules=jdk.incubator.vector \
	-DmultipaperMasterAddress="${MASTER_HOST:-master}:${MASTER_PORT:-35353}" \
	multipaper-paperclip.jar
	"$@"
