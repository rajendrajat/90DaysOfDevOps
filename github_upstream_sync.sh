#!/bin/bash
git fetch upstream
git checkout master
git rebase upstream/master
git push origin master
echo " Hello Rajendra your fork syched or origin updated with upstream"
