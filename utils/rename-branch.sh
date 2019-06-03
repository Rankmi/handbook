#!/bin/bash

old_branch=$1
new_branch=$2

test -z $old_branch && echo "old branch required." 1>&2 && exit 1
test -z $new_branch && echo "new branch required." 1>&2 && exit 1

git branch -m $old_branch $new_branch
git push origin --delete $old_branch
git push --set-upstream origin $new_branch