#!/bin/bash

# function to get work hours
function getWorkHours() {
    local empCheck=$1
    case $empCheck in
        1) workHours=8;;
        2) workHours=4;;
        *) workHours=0;;
    esac
    echo $workHours
}

# constants
WAGE_PER_HOUR=20
FULL_DAY_HOURS=8
PART_TIME_HOURS=4
WORKING_DAYS=20
MAX_WORKING_HOURS=100

# variables
totalWorkingDays=0
totalWorkingHours=0
totalWage=0

# store daily wage along with total wage
declare -A dailyWage

while [[ $totalWorkingDays -lt $WORKING_DAYS && $totalWorkingHours -lt $MAX_WORKING_HOURS ]]
do
    ((totalWorkingDays++))
    empCheck=$((RANDOM%3))
    workHours=$(getWorkHours $empCheck)
    dailyWage["Day $totalWorkingDays"]=$(($workHours * $WAGE_PER_HOUR))
    totalWage=$(($totalWage + ${dailyWage["Day $totalWorkingDays"]}))
    totalWorkingHours=$(($totalWorkingHours + $workHours))
done

echo "Daily Wage :"
for day in "${!dailyWage[@]}"
do
    echo "$day - ${dailyWage[$day]}"
done

echo "Total Wage : $totalWage"
echo "Total Working Days : $totalWorkingDays"
echo "Total Working Hours : $totalWorkingHours"
