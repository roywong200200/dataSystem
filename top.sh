SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

OUTPUT="$(top -bn2 | awk '/^top -/ { p=!p } { if (!p) print }' | grep 'Cpu(s)' | awk {'print $8'})"
echo "*********** This is Checking CPU utilization; Utilization : ${OUTPUT}"
# echo "${OUTPUT}"



wget -O- --post-data='[{"id":"'$ID'","value":"top","top":"'$OUTPUT'"}]' \
          --header=Content-Type:application/json \
            "$SERVERURL"
