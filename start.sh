SERVERIP=$1
ID=$2

while true ;
        do 
                sleep 1;
                ./ip.sg $SERVERIP $ID
                ./temp.sh $SERVERIP $ID;
                ./mem.sh $SERVERIP $ID;
                ./linkq.sh $SERVERIP $ID;
                ./hdfree.sh $SERVERIP $ID&
                ./top.sh $SERVERIP $ID;


        done



