#!/usr/bin/env bash

branchNameBase = $TRAVIS_PULL_REQUEST_BRANCH
branchDestination = $TRAVIS_BRANCH

if [ $branchNameBase ]
then
    echo "Vous etes sur la branch :"
    echo $branchNameBase
    echo "Voys voulez pousser sur la branch :"
    echo $branchDestination
fi
