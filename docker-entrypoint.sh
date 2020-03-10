#!/bin/sh -l
cd $1
echo "Checking languages in $(pwd)..."
data=$(github-linguist)
echo "Result:"
echo $data
echo ::set-output name=data::$(data)