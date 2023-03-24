#!/bin/bash

attendance=$((RANDOM%2))

if [ $attendance -eq 1 ]
then
  echo "Employee is Present"
  wage=$(expr 20 \* 8)
  echo "Daily Wage is $wage"
else
  echo "Employee is Absent"
  echo "Daily Wage is 0"
fi
