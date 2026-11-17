echo "enter number of elements: "
read n
echo "enter array elements: "
for ((i=0;i<n;i++))
do
	read a[i]
done

for ((i=0;i<n-1;i++))
do
	for ((j=0;j<n-i-1;j++))
	do
		if [ ${a[j]} -gt ${a[j+1]} ]; then
			temp1=${a[j]}
			a[j]=${a[j+1]}
			a[j+1]=$temp1
		fi
	done
done
for ((i=0;i<n;i++))
do
	echo -n "${a[i]} "
done
