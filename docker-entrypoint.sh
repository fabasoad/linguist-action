#!/bin/sh -l
cd $1
echo ::set-output name=data::$(github-linguist)