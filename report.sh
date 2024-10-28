#!/bin/bash
myfile="./arrays_table.csv"

arr_1=($(cut -d "," -f 1 $myfile))
arr_2=($(cut -d "," -f 2 $myfile))
arr_3=($(cut -d "," -f 3 $myfile))

diff=("difference")
count=0
for ((i=1; i<${#arr_2[@]}; i++)); do
    diff+=($(( ${arr_3[$i]} - ${arr_2[$i]} )))
done


# echo "arr_2 = ${arr_2[@]}"
# echo "arr_3 = ${arr_3[@]}"
# echo "diff = ${diff[@]}"

temp="./diff.txt"
printf "%s\n" "${diff[@]}" > "$temp"

paste -d "," "$myfile" "$temp" > "./report.csv"
rm "$temp"
report="./report.csv"
echo -e "\nthe 5th column displays the difference between columns 3 and 2:\n"
column -s, -t "$report"