#!/usr/bin/env bash

BRANCHNAMEBASE=$TRAVIS_PULL_REQUEST_BRANCH
BRANCHDESTINATION=$TRAVIS_BRANCH

FILESTOTAL=$(git diff $BRANCHDESTINATION --name-only)
FILES=$(git diff $BRANCHDESTINATION --name-only . ':!*.spec.ts')
NUMBERFILES=${#FILES[@]}
NUMBERFILESTOTAL=${#FILESTOTAL[@]}

echo "Number files $NUMBERFILES";
echo "Number filestotal $NUMBERFILESTOTAL";


if [ $BRANCHNAMEBASE ]
then
    echo "You're on branch :"
    echo $BRANCHNAMEBASE
    echo "You try to push on branch :"
    echo $BRANCHDESTINATION
fi

IFS='/' read -ra PREFIX <<< "$BRANCHNAMEBASE"

if [ ${PREFIX[0]} != "feat" ] && [ ${PREFIX[0]} != "fix" ] && [ ${PREFIX[0]} != "hotfix" ] ; then
  echo "Bad naming of branch !!!";
  echo "As a reminder, your branch must start with the prefix 'feat' or 'fix' or 'hotfix' !!!!!!";
  exit 1;
fi

if [ ${PREFIX[0]} = "feat" ] || [ ${PREFIX[0]} = "fix" ] ; then
  if [ $BRANCHDESTINATION != "dev" ] ; then
    echo "Not allowed to push on branch ${BRANCHDESTINATION} with prefix ${PREFIX[0]}. Only dev";
    exit 1;
  fi
fi

if [ ${PREFIX[0]} = "hotfix" ] ; then
  if [ $BRANCHDESTINATION != "master" ] ; then
    echo "Not allowed to push on branch ${BRANCHDESTINATION} with prefix ${PREFIX[0]}. Only master";
    exit 1;
  fi
fi

FILES=$(git diff --name-only . ':!*.spec.ts')
NUMBERFILES=${#FILES[@]}

echo "Number files $NUMBERFILES";

if [ $NUMBERFILES -gt 10 ] ; then
  echo "Your PR contains too many files. You have $NUMBERFILES files.";
  echo "As a reminder, you must have 10 files max.";
  exit 1;
fi

