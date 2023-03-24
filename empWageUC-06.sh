#!/bin/bash

wage_per_hour=20
full_day_hour=8
part_time_hour=4
working_days_per_month=20
total_wage=0
total_working_hours=0
days_worked=0

while [[ $total_working_hours -lt 100 && $days_worked -lt 20 ]]
do
  attendance=$((RANDOM%3))

  case $attendance in
    1)
      echo "Day $((days_worked+1)): Employee is Present"
      wage=$(expr $wage_per_hour \* $full_day_hour)
      total_working_hours=$(expr $total_working_hours + $full_day_hour)
      ;;
    2)
      echo "Day $((days_worked+1)): Employee is Part-time"
      wage=$(expr $wage_per_hour \* $part_time_hour)
      total_working_hours=$(expr $total_working_hours + $part_time_hour)
      ;;
    *)
      echo "Day $((days_worked+1)): Employee is Absent"
      wage=0
      ;;
  esac

  total_wage=$(expr $total_wage + $wage)
  days_worked=$(expr $days_worked + 1)
  echo "Wage for Day $((days_worked)) is $wage"
done

echo "Total Wage for the Month is $total_wage"
