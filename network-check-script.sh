#! /bin/bash
 
echo "Enter Node1 IP:"
read node1
ping ${node1} -c 2 | grep 'packet loss' | awk -F',' '{print $3}' > output.txt

if [ "$(cat output.txt)" == '+2 errors' ]
then
	#echo "Node1 is unreachable" | mail -s "Node monitoring alert" nandita.pal@codezeros.com
	echo "Node1 is unreachable"
else
	echo "Node1 is reachable"
fi

