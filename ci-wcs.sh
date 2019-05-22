#!/usr/bin/env bash

BRANCHNAMEBASE=$TRAVIS_PULL_REQUEST_BRANCH
BRANCHDESTINATION=$TRAVIS_BRANCH

if [ $BRANCHNAMEBASE ]
then
    echo "You're on branch :"
    echo $branchNameBase
    echo "You try to push on branch :"
    echo $branchDestination
fi

PREFIX=$(echo $BRANCHNAMEBASE | tr "/" "\n")

echo "Prefix :"
echo ${PREFIX[0]};

#if (($prefix[0] === "feat" || $prefix[0] === "fix") && $branchDestination === "dev")
