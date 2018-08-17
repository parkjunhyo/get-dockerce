#! /usr/bin/env bash

defgwif=$(route | grep -i 'default' | awk -F "[ ]" '{print $NF}')
defip=`ifconfig $defgwif | grep -i "inet addr:" | awk -F "[\: ]" '{print $13}'`
ref="./init-swarms.out.txt"
docker swarm init --advertise-addr=$defip > $ref


srcf="./init-swarms.source"
remoteip=`cat $ref | grep -i '\-\-token' | awk -F "[ ]" '{print $NF}'`
tokenstring=`cat $ref | grep -i '\-\-token' | awk -F "[ ]" '{print $(NF-1)}'`
echo "token-string=\""$tokenstring"\"" > $srcf
echo "target-string\"="$remoteip"\"" >> $srcf



