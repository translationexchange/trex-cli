#!/bin/zsh

echo "Testing Obj-C"

for i in samples/*.m; do 
  found=$(./lib/genstrings.js $i | grep "label" | wc -l); 
  exist=$(grep "^ *TMLLocalizedString" $i | wc -l); 
  echo "$i $found $exist"; 
done
