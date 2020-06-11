#!/bin/bash

NODE_BINAR_PATH='/home/ava/ava/'
LOG_PATH=$HOME/ava-update.log

## end of config ----------------

TMP_PATH='/tmp/ava-update/'

LATEST=$(curl --silent "https://api.github.com/repos/ava-labs/gecko/releases" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | head -n 1 | tr -d 'v')
CURRENT=$(cd $NODE_BINAR_PATH && ./ava -version | tr -d 'avlnche/')

TIMESTAMP=$(date "+%B %d %H:%M:%S")

function update() {

    rm -rf $TMP_PATH*

    mkdir -p /tmp/ava-update

    DOWNLOAD="https://github.com/ava-labs/gecko/releases/download/v$LATEST/gecko-linux-$LATEST.tar.gz"

    if [ -z "$DOWNLOAD" ]; then

        echo "$TMP_PATH - ERROR: Can't get download link." >>"$LOG_PATH"
        echo " " >>"$LOG_PATH"

        exit 1

    fi

    cd "$TMP_PATH" && wget "$DOWNLOAD" && tar -xf "gecko-linux-$LATEST.tar.gz"

    chown -R ava:ava $TMP_PATH

    until [ "$(systemctl is-active denali.service)" = "active" ]; do
        systemctl stop denali && sleep 3
    done

    cd $NODE_BINAR_PATH && rm -rf ava plugins

    cd $TMP_PATH/gecko-"$LATEST" && mv * $NODE_BINAR_PATH

    chown -R ava:ava $NODE_BINAR_PATH

    systemctl start denali

    echo "$TIMESTAMP - Successfully updated to version $LATEST !" >>"$LOG_PATH"
    echo " " >>"$LOG_PATH"

    exit 0

}

function main() {

    if [ -z "$CURRENT" ]; then

        echo "$TIMESTAMP - ERROR: Could not get latest current version. Node is not running." >>"$LOG_PATH"
        echo " " >>"$LOG_PATH"

    else

        if [ -z "$LATEST" ]; then

            echo "$TIMESTAMP - ERROR: Couldn't get the latest tag from Github." >>"$LOG_PATH"
            echo " " >>"$LOG_PATH"

        else

            echo "$TIMESTAMP - Your current version is:  $CURRENT" >>"$LOG_PATH"

            if [[ $CURRENT != *$LATEST* ]]; then

                echo "$TIMESTAMP - Latest tag from github: $LATEST" >>"$LOG_PATH"
                echo "$TIMESTAMP - Triggering automated upgrade ..." >>"$LOG_PATH"
                echo " " >>"$LOG_PATH"

                update "$LATEST"

            else

                echo "$TIMESTAMP - Latest tag from github: $LATEST" >>"$LOG_PATH"
                echo "$TIMESTAMP - No update required." >>"$LOG_PATH"
                echo " " >>"$LOG_PATH"

            fi

        fi

    fi

}

if [ ! -e "$LOG_PATH" ]; then
    touch "$LOG_PATH"
fi

main
