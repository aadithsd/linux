touch att.txt

while true
do
	echo "1. add student"
	echo "2. mark attendance"
	echo "3. display "
	echo "4. search student"
	echo "5. exit"
	
	echo "enter choice: "
	read ch
	
	case $ch in
		
		1)	echo "enter roll no: "
			read r
			
			echo "enter name: "
			read n
			
			echo "$r | $n | 0 | 0">>att.txt
			echo "student added successfully"
			;;
		
		2)	echo "enter roll no: "
			read r
			
			if grep -q "^$r " att.txt
			then
				line=$(grep "^$r |" att.txt)
				
				name=$(echo "$line" |	cut -d'|' -f2 | xargs)
				ab=$(echo "$line" | cut -d '|' -f3 | xargs)
				pr=$(echo "$line" | cut -d '|' -f4 | xargs)
				
				echo "enter A for absent - P for present"
				read st
				
				if [ "$st" = "A" ] || [ "$st" = "a" ]
				then
					ab=$((ab+1))
					sed -i "s/^$r |.*/$r | $name | $ab | $pr/" att.txt
					echo "attendence marked"
					
				elif [ "$st" = "P"  ] || [ "$st" = "p" ]
				then
					pr=$((pr+1))
					sed -i "s/^$r |.*/$r | $name | $ab | $pr/" att.txt
					echo "attendence marked"
				else
					echo "invalid attendence"
				fi
			else
				echo "no student founf"
			fi
			;;
			
		3)	if [ -f att.txt ]
			then
				cat att.txt
			else
				echo "no students"
			fi
			;;
			
		
		4)	echo "enter roll no: "
			read r
			
			if grep -q "^$r |" att.txt
			then
				grep "^$r |" att.txt
			else
				echo "inivalid roll no."
			fi
			;;
			
		5) 	echo "thank you"
			exit
			;;
		
		*)	echo "enter valid option"
			;;
	esac
done
