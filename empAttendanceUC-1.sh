#!/bin/bash

attendance=$((RANDOM%2))

if [ $attendance -eq 1 ]
then
  echo "Present"
else
  echo "Absent"
fi
