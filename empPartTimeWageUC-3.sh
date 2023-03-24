#!/bin/bash

attendance=$((RANDOM%3))

if [ $attendance -eq 1 ]
then
  echo "Employee is Present"
  wage=$(expr 20 \* 8)
  echo "Daily Wage is $wage"
elif [ $attendance -eq 2 ]
then
  echo "Employee is Part-time"
  wage=$(expr 20 \* 4)
  echo "Daily Wage is $wage"
else
  echo "Employee is Absent"
  echo "Daily Wage is 0"
fi
