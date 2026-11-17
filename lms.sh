cat book.txt

while true
do
	echo "1. add book"
	echo "2. display"
	echo "3. check availability"
	echo "4. Issue book"
	echo "5. Return book"
	echo "6. Exit"
	
	echo "enter choice: "
	read ch
	
	case $ch in
		
		1)	echo "enter book id: "
			read bid
			
			echo "enter book title: "
			read t
			
			echo "enter author: "
			read au
			
			echo "$bid $t $au Available">>book.txt
			
			echo "book added successfully"
			;;
			
		2)	if [ -s book.txt ];
			then
				cat book.txt
			else
				echo "no books"
			fi
			;;
		
		3)	echo "enter book id: "
			read bid
			
			grep "^$bid " book.txt || echo "book not found"
			;;
		
		4)	echo "enter book id: "
			read bid
			
			if grep -q "^$bid .*Available" book.txt
			then
				sed -i "/^$bid /s/Available/Issued/" book.txt
				echo "Book issued successfully"
			else
				echo "book not available"
			fi
			;;
		
		5)	echo "enter book id: "
			read bid
			
			if grep -q "^$bid .*Issued" book.txt
			then
				sed -i "/^$bid /s/Issued/Available/" book.txt
				echo "book returned successfuly"
			else
				echo "book not available"
			fi
			;;
		
		6)	echo "thank you"
			exit
			;;
		
		*)	echo "enter valid option"
			;;
		
	esac
done
