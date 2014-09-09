user=$1
pass=$2

#--- validate command line paramters ---
if test $# -lt 2 ; then
	echo "Usage: pull-all.sh <<userName>> <<password>>"
	exit 1
fi

#--- save repos with "our" code from components.list file ---
while read line
do
	if [[ $line ]]; then		
		rm -r components/__$line 2>/dev/null
		mv components/$line components/__$line
	fi
done < components.list

read -p "Press enter to continue pull-all"

#--- update "other" components with bower
bower update

#--- restore repos with "our" code from components.list file ---
while read line
do
	if [[ $line ]]; then		
		rm -r components/$line 2>/dev/null
		mv components/__$line components/$line
	fi
done < components.list


#--- pull all "our" files from components.list file ---
while read line
do
	if [[ $line ]]; then		
		pull-repo.sh $user $pass $line components
	fi
done < components.list

