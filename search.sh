array=("apple" "banana" "grape" "cherry" "mango")
echo "enter element to search: "
read s
i=0
f=0
for i in "${array[@]}" 
do
	if [ "$i" = "$s" ]; then
		f=1
		break
	fi
done

if [ "$f" -eq 0 ]; then
	echo "element not found"
else
	echo "element $s found"
fi
