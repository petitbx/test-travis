#!/usr/bin/env bash

branchNameBase=$1
branchNameTarget=$2

if [ $branchName ]
then
    echo "Vous etes sur la branch :"
    echo $branchName
    echo "Voys voulez pousser sur la branch :"
    echo $branchNameTarget
fi

