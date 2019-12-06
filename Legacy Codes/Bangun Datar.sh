#!/bin/bash
clear
loop=y

menu () {
  echo "Pilih Penjumlahan"
  echo "1. Hitung Luas Permukaan Kubus"
  echo "2. Hitung Luas Permukaan Prisma Segitiga"
  echo "3. Hitung Luas Permukaan Limas Segitiga"
  echo "4. Median Dari Ketiga Luas Permukaan"
  echo "5. Exit"
}

kubus () {
  echo "Masukkan Panjang Rusuk : "
  read sisikbs
  let luassisi=$sisikbs*$sisikbs
  let asisi=$luassisi*6
  echo "Luas Permukaan Persegi : $asisi"
}

prismasegitiga () {
  echo "Masukkan Luas Alas : "
  read lalas2
  echo "Masukkan Luas Salah Satu Bidang Tegak : "
  read lssbt
  let lalas2=$lalas2*2
  let lssbt3=$lssbt*3
  let lps=$lalas2+$lssbt3
  echo "Luas Permukaan Prisma Segitiga : $lps"
}

limassegitiga () {
  echo "Masukkan Luas Alas : "
  read lalas1
  echo "Masukkan Luas sisi : "
  read lsisi1
  let las=$lsisi1*3
  let lls=$las+$lalas1
  echo "Luas Permukaan Limas Segitiga : $lls"
}

median () {
  let urut[0]=$asisi
  let urut[1]=$lps
  let urut[2]=$lls
  echo "Data Sebelum Diurutkan"
  echo "${urut[0]} ${urut[1]} ${urut[2]}"
  for ((i = 0; i<3; i++))
  do
    for ((j=i+1; j<3; j++))
    do
      if ((${urut[i]}-gt${urut[j]}))
      then
        let temp=${urut[i]}
        let urut[$i]=${urut[j]}
        let urut[$j]=$temp
      fi
    done
  done
  echo "Data Setelah Diurutkan"
  echo "${urut[0]} ${urut[1]} ${urut[2]}"
  echo "Median Adalah ${urut[1]}"
}

while [ $loop == 'y' ]
do
menu
read tambah

case $tambah in
1)
kubus
;;

2)
prismasegitiga
;;

3)
limassegitiga
;;

4)
median
;;

5)
echo "Terima Kasih"
exit 1

esac
done
