SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

FREE="$( df -P | awk '{sum += $4} END {print sum}' )"
FREEINMB=$(( FREE / 1024 ))


echo "*********** This is Checking HARDDISKFREESPACE; HARDDISKFREESPACE : ${FREEINMB}"
# echo "${FREEINMB}"

wget -O- --post-data='[{"id":"'$ID'","value":"harddiskFreeSpace","harddiskFreeSpace":"'$FREEINMB'"}]' \
                  --header=Content-Type:application/json \
                              "$SERVERURL"
