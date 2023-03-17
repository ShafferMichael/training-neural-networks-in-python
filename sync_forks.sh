#!/bin/bash

# Add the upstream remote if it doesn't exist already
if ! git remote | grep -q "upstream"; then
  git remote add upstream https://github.com/LinkedInLearning/training-neural-networks-in-python-3215347.git
fi

# Fetch all branches from the upstream repository
git fetch upstream

# Push each upstream branch to your fork
for branch in $(git branch -r | grep 'upstream/' | sed 's/upstream\///'); do
  git push origin "refs/remotes/upstream/$branch:refs/heads/$branch"
done
