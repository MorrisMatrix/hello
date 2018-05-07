#!/bin/bash
dronetoken=$1
if [[ $dronetoken = "" ]]; then
	echo "Drone secret should be first parameter."
	exit $rc
fi

access=$2
if [[ $access = "" ]]; then
	echo "AWS access key should be second parameter."
	exit $rc
fi

secret=$3
if [[ $secret = "" ]]; then
	echo "AWS secret should be third parameter."
	exit $rc
fi

export DRONE_SERVER=https://drone.ecg-test.com
export DRONE_TOKEN=$dronetoken

drone info

drone secret add MorrisMatrix/hello aws_access_key_id $access
drone secret add MorrisMatrix/hello aws_secret_access_key $secret

drone secret ls MorrisMatrix/hello