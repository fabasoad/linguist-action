#!/bin/sh -l
data=$(ruby /app/linguist.rb $1 $2)
echo ::set-output name=data::$data