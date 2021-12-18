#!/bin/bash
sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ LogA.txt >> Access_denied.txt
awk -F" " '{print $4, $6}' Access_denied.txt >> filtered_logs.txt