#!/bin/bash

#roomname
r=evaltest

#nodes
n=$1

#Tetstdauer in Sekunden/duration
d=$2

#participants/Teilnehmer. Kleiner oder gleich der Anzahl der nodes!
#p=

#video senders
#v=

#audio senders
a=0

docker compose up -d --scale node=$1
docker compose exec torture \
        ./scripts/malleus.sh \
        --conferences=1 \
        --participants=$1 \
        --senders=$1 \
        --audio-senders=$a \
        --duration=$2 \
        --room-name-prefix= \
        --hub-url=http://hub:4444/wd/hub \
        --instance-url=https://meet.ffm.de/$r