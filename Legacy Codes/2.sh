#!/bin/bash
clear
tes=y

while [ $tes == 'y' ]
do
echo "== Program Nilai Terbesar Kedua di dalam Array =="
echo "1. Demo Program Array"
echo "2. Lihat Data Array"
echo "3. Penjumlahan Data Array"
echo "4. Exit"
echo "Pilihan :"
read pil

case $pil in
1)
echo "Masukkan banyak element array : "
read input

for((i=0;i<$input;i++))
do
	printf "Index Array - $i : "
	read array[i]
done

terbesar_prtm=0
for((i=0;i<$input;i++))
do
	if [[ $terbesar_prtm -lt ${array[i]} ]]
	then
		let terbesar_prtm=${array[i]}
		let j=i
	fi
done

terbesar_kedua=0
index=0
for((i=0;i<$input;i++))
do
	if [[ $i -eq $j ]]
	then
		let i=i+1
		let i=i-1
	else
		if [[ $terbesar_kedua -lt ${array[i]} ]]
		then	
			let terbesar_kedua=${array[i]}
			let index=i
					
	     	fi
	fi
done

printf "\n"
echo "Nilai terbesar kedua di dalam array adalah : $terbesar_kedua"
echo "Index Array ke : $index"
read
clear
;;

2)
if [[ $input -eq 0 ]]
then
	printf "Data Masih Kosong \n"
else
	echo ${array[@]}
fi
read
clear
;;

3)
if [[ $input -eq 0 ]]
then
	printf "\n"
	printf "0\n"
else
	banyak_data=${#array[@]};
	flag=0
	for((i=0;i<$banyak_data;i++))
	do
		let flag=$(expr "$flag" + "${array[i]}") 
	done
echo "Jumlah all data array : $flag"
fi
read
clear
;;

4)
printf "\n"
echo "Terima kasih telah menggunakan program ini"
exit 1

esac
done
