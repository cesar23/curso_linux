#!/bin/bash
function copyFiles() {
   local msg="$1"   # Save first argument in a variable
   shift            # Shift all arguments to the left (original $1 gets lost)
   local arr=("$@") # Rebuild the array with rest of arguments
   for i in "${arr[@]}";
      do
          echo "$msg $i"
      done
}

array=("one" "two" "three")

copyFiles "Copying" "${array[@]}"
