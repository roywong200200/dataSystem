SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

OUTPUT2="$(sudo iftop -t -L1 -s1 -i wlan0 2> /dev/null| grep 'Total send and receive rate:' | cut -c52-60 | tr -d " ")"

echo "iftop    ${OUTPUT2}"
# echo "${OUTPUT2}"

wget -O- --post-data='[{"id":"'$ID'","value":"iftop","iftop":"'$OUTPUT2'"}]' \
          --header=Content-Type:application/json \
            "$SERVERIP"
