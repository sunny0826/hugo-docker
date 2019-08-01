#!/bin/sh
URL=${SOURCE_URL}

log(){
    echo ''
    echo '-------------------------------------'
    echo "$*"
    echo '-------------------------------------'
    echo ''
}

if [ -z "$URL" ]; then
  log 'Missing environment variable: $SOURCE_URL'
  exit 0
else
  log "Pull code"
fi 

log "Git clone $URL "
git clone --progress --verbose $URL source 
cd source 
git submodule update --init --recursive 

log "Hugo build"
hugo -d /work-dir

if [ $? -ne 0 ]; then
    log "Hugo build failed!"
else
    log "Hugo build succeed!"
fi