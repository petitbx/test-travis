#!/usr/bin/env bash

branchName = ${CIRCLE_BRANCH}


if [ $branchName ]
then
    echo "Vous etes sur la branch :"
    echo $branchName
fi

