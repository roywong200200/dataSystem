SERVERIP=$1
ID=$2


SERVERURL=$1":8002/postdata.html"

OUTPUT="$( ifconfig wlan1 | grep -w "inet" | awk '{print $2}' )"
echo "*********** This is Checking IP; IP : ${OUTPUT}"
# echo "${OUTPUT}"

wget -O- --post-data='[{"id":"'$ID'","value":"ip","ip":"'$OUTPUT'"}]' \
                  --header=Content-Type:application/json \
                              "$SERVERURL"

