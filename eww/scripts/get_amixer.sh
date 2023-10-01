p=$(amixer sget $1 | awk -F"[][]" '/Left:/ { print $2 }')
val=${p::-1}
echo $(($val + 0))
