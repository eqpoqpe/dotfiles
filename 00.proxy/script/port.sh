if [ -e "$1" ]; then
	for gs in $(cat $1); do
		declare readonly $gs
	done
else
	http="None"
	https="None"
	sock="None"
fi
