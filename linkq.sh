SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

LINK="$( iwconfig wlan1 | grep 'Link Quality' | awk '{print $2}'  )"
LINK=(${LINK//=/ })
echo ${LINK[1]}
LINK=(${LINK[1]//// })
echo ${LINK[0]}
echo ${LINK[1]}
LINK=$(( LINK[0] / LINK[1] * 100))
echo ${LINK}
echo "*********** This is Checking linkQuality; linkQuality : ${LINK}"
# echo "${LINK}"

wget -O- --post-data='[{"id":"'$ID'","value":"linkQuality","linkQuality":"'$LINK'"}]' \
                 --header=Content-Type:application/json \
                    "$SERVERURL"
