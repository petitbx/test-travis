#!/usr/bin/env bash

branchName=$1

if [ $branchName ]
then
    echo "Vous etes sur la branch :"
    echo $branchName
fi

