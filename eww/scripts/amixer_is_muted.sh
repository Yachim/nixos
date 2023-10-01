if amixer sget $1 | tail -2 | grep -q '\[on\]'; then
	echo "false"
else
	echo "true"
fi
