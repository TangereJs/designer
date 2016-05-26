

#--- save repos with "our" code from components.list file ---
while read line
do
	if [[ $line ]]; then				
	echo $line
	ls components/$line
	fi
done < components.list

