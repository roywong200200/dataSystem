SERVERIP=$1
ID=$2
SERVERURL=$1":8002/postdata.html"

TOTAL="$( cat /proc/meminfo | grep 'MemTotal' | awk {'print $2'})"
FREE="$( cat /proc/meminfo | grep 'MemFree' | awk {'print $2'} )"


MEM=$((TOTAL - FREE))
MEMU=$((MEM * 10000 / TOTAL))

NUM=$((MEMU/100))
DEC=$((MEMU - (NUM*100)))


if (($DEC < 10 ))
then
        RESULT=$NUM".0"$DEC
else
        RESULT=$NUM"."$DEC
fi

echo "*********** This is Checking memUtilization; : ${RESULT}"
# echo "${RESULT}"

wget -O- --post-data='[{"id":"'$ID'","value":"memUtilization","memUtilization":"'$RESULT'"}]' \
          --header=Content-Type:application/json \
            "$SERVERURL"
