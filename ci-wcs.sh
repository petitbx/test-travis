#!/usr/bin/env bash

if [ $branchNameBase ]
then
    echo "Vous etes sur la branch :"
    echo $branchNameBase
   # echo "Voys voulez pousser sur la branch :"
   # echo $branchNameTarget
fi

if [ $CIRCLE_PR_NUMBER ]
then
    curl -L "https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64" \
      -o jq
    chmod +x jq
    url="https://api.github.com/repos/org/repo/pulls/$CIRCLE_PR_NUMBER?access_token=$GITHUB_TOKEN"
    target_branch=$(
      curl "$url" | ./jq '.base.ref' | tr -d '"'
    )
fi

echo $target_branch
