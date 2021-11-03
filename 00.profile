declare PROXY_DIR="/mnt/allens/fix/.proxy"

# set port for PROXY
if [ -d "$PROXY_DIR" ] && [ -e "$PROXY_DIR/enable/default" ]; then
        declare readonly USER_PROXY="$PROXY_DIR/User"
        declare readonly SCRIPT_PROXY="$PROXY_DIR/script"
        declare readonly DEFAULT_PROXY="$PROXY_DIR/enable"
	
	for gs in $(cat $DEFAULT_PROXY/default); do
		if [ "${gs##*00}" = "port" ]; then

		# set script for PORT
		declare readonly SCRIPT_PORT="$SCRIPT_PROXY/port.sh"
		. "$SCRIPT_PORT" $USER_PROXY/$gs
		elif [ "${gs##*00}" = "select" ]; then

		# set script for host
		declare readonly SCRIPT_HOST="$SCRIPT_PROXY/select.sh"
		. "$SCRIPT_HOST" $USER_PROXY/$gs
		fi
        done
fi
