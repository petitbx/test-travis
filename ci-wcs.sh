#!/usr/bin/env bash

BRANCHNAMEBASE=$TRAVIS_PULL_REQUEST_BRANCH
BRANCHNAMEBASE="feat/circle"
BRANCHDESTINATION=$TRAVIS_BRANCH

if [ $BRANCHNAMEBASE ]
then
    echo "You're on branch :"
    echo $BRANCHNAMEBASE
    echo "You try to push on branch :"
    echo $BRANCHDESTINATION
fi

IFS='/' read -ra PREFIX <<< "$BRANCHNAMEBASE"

echo "Prefix :"
echo ${PREFIX[0]};

if [ $PREFIX[0] = "feat" ] || [ $PREFIX[0] = "fix" ] ; then
  if [ $BRANCHDESTINATION != "dev" ] ; then
    echo "Impossible de pousser sur la branch ${BRANCHDESTINATION} avec le prefix ${PREFIX[0]}. Uniquement dev";
    exit 1;
  fi
fi
