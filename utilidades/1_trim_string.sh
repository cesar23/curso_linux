

#------------------------------------------
#fuente mas  trims: https://linuxhint.com/trim_string_bash/
#------------------------------------------



# Declare a variable, $myVar with a string data
myVar="     Web Design Courses    "

# The following command will print the output with the leading and trailing spaces of the

echo "I want to learn $myVar from this site"

# The following `sed` command will remove the trailing spaces from the variable
myVar=`echo $myVar | sed 's/ *$//g'`

# Print the output after removing the spaces
echo "I want to learn $myVar from this site"

read -p "Presionar:"