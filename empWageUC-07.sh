#!/bin/bash

wage_per_hour=20
full_day_hour=8
part_time_hour=4
working_days_per_month=20
total_wage=0
total_working_hours=0
days_worked=0

get_work_hours() {
  attendance=$1

  case $attendance in
    1)
      echo $full_day_hour
      ;;
    2)
      echo $part_time_hour
      ;;
    *)
      echo 0
      ;;
  esac
}

while [[ $total_working_hours -lt 100 && $days_worked -lt 20 ]]
do
  attendance=$((RANDOM%3))

  work_hours=$(get_work_hours $attendance)

  if [[ $work_hours -eq 0 ]]
  then
    echo "Day $((days_worked+1)): Employee is Absent"
    wage=0
  elif [[ $work_hours -eq $full_day_hour ]]
  then
    echo "Day $((days_worked+1)): Employee is Present"
    wage=$(expr $wage_per_hour \* $full_day_hour)
  else
    echo "Day $((days_worked+1)): Employee is Part-time"
    wage=$(expr $wage_per_hour \* $part_time_hour)
  fi

  total_wage=$(expr $total_wage + $wage)
  total_working_hours=$(expr $total_working_hours + $work_hours)
  days_worked=$(expr $days_worked + 1)
  echo "Wage for Day $((days_worked)) is $wage"
done

echo "Total Wage for the Month is $total_wage"
