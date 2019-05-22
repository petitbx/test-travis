#!/usr/bin/env bash

branchNameBase=$TRAVIS_PULL_REQUEST_BRANCH
branchDestination=$TRAVIS_BRANCH

if [ $branchNameBase ]
then
    echo "You're on branch :"
    echo $branchNameBase
    echo "You try to push on branch :"
    echo $branchDestination
fi

prefix=$(echo $branchNameBase | tr "/" "\n")

echo "Prefix :"
echo ${prefix[0]};

#if (($prefix[0] === "feat" || $prefix[0] === "fix") && $branchDestination === "dev")
