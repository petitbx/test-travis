#!/usr/bin/env bash

BRANCHNAMEBASE=$TRAVIS_PULL_REQUEST_BRANCH
BRANCHDESTINATION=$TRAVIS_BRANCH

if [ $BRANCHNAMEBASE ]
then
    echo "You're on branch :"
    echo $BRANCHNAMEBASE
    echo "You try to push on branch :"
    echo $BRANCHDESTINATION
fi

TEST='/' read -ra PREFIX <<< "$BRANCHNAMEBASE"

echo "Prefix :"
echo ${PREFIX[0]};

#if (($prefix[0] === "feat" || $prefix[0] === "fix") && $branchDestination === "dev")
