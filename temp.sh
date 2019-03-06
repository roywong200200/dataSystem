


SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

OUTPUT="$(vcgencmd measure_temp | cut -c6-15)"
echo "*********** This is checking Temp ; Temp :${OUTPUT}"
# echo "${OUTPUT}"
wget -O- --post-data='[{"id":"'$ID'","value":"temp","temp":"'$OUTPUT'"}]' \
          --header=Content-Type:application/json \
            "$SERVERURL"