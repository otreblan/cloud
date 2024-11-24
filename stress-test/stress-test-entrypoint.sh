#!/usr/bin/env sh

java \
	-Dbot.ip=${STRESS_TEST_IP:-127.0.0.1} \
	-Dbot.protocol.version=763 \
	-jar minecraft-stress-test-1.0.0-SNAPSHOT-jar-with-dependencies.jar "$@"
