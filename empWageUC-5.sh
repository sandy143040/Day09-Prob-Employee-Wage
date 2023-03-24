#!/bin/bash

wage_per_hour=20
full_day_hour=8
part_time_hour=4
working_days_per_month=20
total_wage=0

for (( day=1; day<=$working_days_per_month; day++ ))
do
  attendance=$((RANDOM%3))

  case $attendance in
    1)
      echo "Day $day: Employee is Present"
      wage=$(expr $wage_per_hour \* $full_day_hour)
      ;;
    2)
      echo "Day $day: Employee is Part-time"
      wage=$(expr $wage_per_hour \* $part_time_hour)
      ;;
    *)
      echo "Day $day: Employee is Absent"
      wage=0
      ;;
  esac

  total_wage=$(expr $total_wage + $wage)
  echo "Wage for Day $day is $wage"
done

echo "Total Wage for the Month is $total_wage"
