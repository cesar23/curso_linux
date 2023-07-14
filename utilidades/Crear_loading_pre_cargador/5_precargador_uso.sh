#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

end_number=100
echo -ne 'ya\r'
ProgressBar 10 ${end_number}  && sleep 4
echo -ne '\rya'
ProgressBar 20 ${end_number}  && sleep 3
echo -ne '\rya'
ProgressBar 40 ${end_number}  && sleep 4
echo "subiendo 2 .."
ProgressBar 80 ${end_number}  && sleep 4
echo "subiendo 4 .."
ProgressBar 100 ${end_number}  && sleep 4

