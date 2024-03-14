#! /bin/bash

ping 192.168.109.79 -c 2 | grep 'packet loss' | awk -F',' '{print $3}' > output.txt

if [ cat output.txt == '+2 errors' ] 
then
	echo "Node1 is unreachable" | mail -s "Node monitoring alert" nandita.pal@codezeros.com
else
        
fi

