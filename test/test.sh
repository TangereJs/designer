

#--- save repos with "our" code from components.list file ---
while read line
do
	if [[ $line ]]; then				
		echo "***" $line "***"
    bower install TangereJs/$line#0.8-preview
	fi
done < ../components.list

