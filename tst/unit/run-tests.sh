#!/bin/sh

INDEX=0
for TEST in *.scm; do
    csi -q "$TEST" || FAIL[$INDEX]="$TEST" && ((++INDEX))
done

if (( ${#FAIL[@]} )); then
    echo "FAIL: ${FAIL[*]}"
else
    echo "SUCCESS"
fi
