#!/bin/bash

prepare() {
    CONFIG_FILE=$1
    rm -f $CONFIG_FILE.tmp
}

ask() {
    local prompt_text="$1"
    local default_value="$2"

    read -p "$prompt_text [$default_value]: " user_input
    echo ${user_input:-$default_value}
}

save_config() {
    local parameter="$1"
    local value="$2"

    echo -e "$parameter=$value" >> $CONFIG_FILE.tmp
}

prompt_config() {
    local parameter="$2"

    value=$(ask "$1" "$3")
    save_config $parameter $value
}

finalize() {
    echo ""
    echo $CONFIG_FILE:
    cat $CONFIG_FILE.tmp
    echo ""

    if [[ $(ask "Is this ok?" "yes") == "yes" ]]; then
        mv $CONFIG_FILE.tmp $CONFIG_FILE
        echo "Configuration saved: '$CONFIG_FILE'."
    else
        rm $CONFIG_FILE.tmp
        echo "Configuration discarded."
    fi
}
