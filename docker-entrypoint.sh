#!/bin/sh -l
data=$(ruby /linguist.rb $1 $2)
echo ::set-output name=data::$data