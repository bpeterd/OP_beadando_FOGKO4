#!/bin/bash
curl_function(){
curl i- https://1drv.ms/t/s!AuJZ6H4pT_wqgP4LtxbUBkEwoZvUEQ?e=MbANUV -o minden.txt
echo "Fájl sikeresen letöltve."
ls
}

me_function(){
echo "B. Péter"
echo "FOGKO4"
}


file_function(){
echo "Két fájl létrehozva (relationships.txt, familytree.txt)"
printf "mother\n father\n daughter\n son\n grandson\n granddaughter\n grandmother\n grandfather\n uncle\n aunt\n cousin\n"> relationships.txt
printf "Sara\n Andrew\n Stephanie\n Eric\n Peter\n Clara\n Judith\n Oscar\n Ben\n Molly\n Madison\n"> familytree.txt
}
sz_function() {
fileName=$1
if [[ -f $fileName ]]
then 
	echo "Üsse be a keresett szót: "
	read grepvar
	cat $fileName|grep $grepvar
else
	echo "$fileName nem létezik, keressen megfelelő és létező fájlt!"
	
fi
}

help_function() {
echo "-r relationship.txt"
echo "-t familytree.txt"
}

while getopts :omhcs:f opt;do
	case $opt in
	f)
		file_function;;

	m)
 		me_function;;
	r) 	
		nano relationships.txt;;
	t)
		nano familytree.txt;;
	h)
		help_function;;
	c)
		curl_function;;
	s)
		sz_function $OPTARG;;
	:) echo "Kapcsoló vár értékét: $OPTARG";;
	*)
		echo "Ilyen funkció nem létezik, próbálja újra!"

	exit ;;
	esac
done
