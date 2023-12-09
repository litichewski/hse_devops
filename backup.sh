#!/bin/bash

exec 2>error.log

function show_help() {
    echo "Syntax: $0 [-h] [-a algorithm] [-o output] [-d directory]"
    echo "    -h, --help       Show help message"
    echo "    -a               Compression algorithm: gzip, bzip2, none"
    echo "    -o               Output file name"
    echo "    -d               Directory to backup"
}

while [ "$1" != "" ]; do
    case $1 in
        -h | --help)
            show_help
            exit
            ;;
        -a )
            shift
            algorithm=$1
            ;;
        -o )
            shift
            output=$1
            ;;
        -d )
            shift
            directory=$1
            ;;
        * )
            echo "Incorrect argument: $1" >&2
            exit 1
            ;;
    esac
    shift
done

case $algorithm in
    gzip )
        algorithm='gzip'
        ;;
    bzip2 )
        algorithm='bzip2'
        ;;
    none )
        algorithm='cat'
        ;;
    * )
        echo "Unknown compression algorithm: $algorithm" >&2
        exit 1
        ;;
esac

function backup() {
    if [ "$algorithm" = "cat" ]; then
        tar cf "$output" "$directory"
    else
        tar cf - "$directory" | $algorithm | openssl enc -aes-256-cbc -out "$output"
    fi
}

backup
