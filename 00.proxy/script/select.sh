if [ -e "$1" ]; then
	declare readonly SELECTED_HOST=$(cat $1)
else
	declare readonly SELECTED_HOST="127.0.0.1"
fi

declare SELECT_PROXY_WAY=( \
	ALL_PROXY="socks://$SELECTED_HOST:$sock/" \
	HTTP_PROXY="http://$SELECTED_HOST:$http/" \
	HTTPS_RPOXY="http://$SELECTED_HOST:$https/" \
	all_proxy="socks://$SELECTED_HOST:$sock/" \
	http_proxy="http://$SELECTED_HOST:$http/" \
	https_proxy="http://$SELECTED_HOST:$https/" \
)

for gs in ${SELECT_PROXY_WAY[@]}; do
	declare -x $gs
done
