

#--- save repos with "our" code from components.list file ---
while read line
do
	if [[ $line ]]; then				
		cd components/$line components
	fi
done < components.list

