
while true
do
   clear
   echo "Program Pembelajaran Pemantapan Sistem Operasi Sederhana"

   echo "========================================"
   echo "1. mengenal perintah-perintah linux (sudo,apt,ping)"
   echo "2. Memperdalam Ilmu Sistem Operasi"
   echo "3. Pingin nulis diword"
   echo "4. Memperbarui software"
   echo "5. Jalankan Program (python/shell)"
   echo "6. perhitungan BBM menggunakan stuknya juga"
   echo "7. Keluar program"
   echo "masukkan pilihan menu sesuai keinginan :"
   read pilih
   clear

   if [ $pilih == 1 ]
   then
	echo "1. ingin mengetahui fungsi sudo?"
	echo "2. apa sebenarnya fungsi apt?"
	echo "3. arti dan fungsi ping sebenarnya?"
	echo "4. exit"
	read sesukanya
		if [ $sesukanya == 1 ]
   		then
			man sudo
		fi
		
		if [ $sesukanya == 2 ]
   		then
			man apt
		fi

		if [ $sesukanya == 3 ]
   		then
			man ping 
		fi
   fi

   if [ $pilih == 2 ]
   then
      firefox https://github.com/Rakhid16/Praktikum-Sistem-Operasi
   fi
   
   if [ $pilih == 3 ]
   then
      libreoffice
   fi

   if [ $pilih == 4 ]
   then
           echo "Ketika anda menggunakan linux sebaiknya mengupdate dan mengupgrade agar OS Linux dapat"
	   echo "dapat berjalan semestinya"
	   echo "1. pingin update"
	   echo "2. pingin upgrade"
	   read pilihan
	
	   if [ $pilihan == 1 ]
   	   then
		echo "tunggu hingga selesai..."
      		sudo apt update
	   fi

   	   if [ $pilihan == 2 ]
           then 
		echo "tunggu hingga selesai..."     
		sudo apt upgrade
           fi
   fi

   if [ $pilih == 5 ]
      then
	echo "1.python?"
	echo "2.program shell?"
	read prog

	if [ $prog == 1 ]
	then
         echo "bikin dulu programnya(contoh.py)!"
         echo "nama file'nya apa nih? : "
         read nama_file_python
         nano $nama_file_python

         echo "Oke file Python udah jadi, ini hasil eksekusi'nya"
         python3 $nama_file_python
         read
         clear
   	fi

	if [ $prog == 2 ]
	then
         echo "apa nama program anda(contoh.sh)"
         echo "mohon diisi nama : "
         read nama_file_B
         nano $nama_file_B

         echo "ini hasil eksekusi'nya"
         bash $nama_file_B
         read
         clear
   	fi
  fi

   if [ $pilih == 6 ]
   then

z=0
menu=0
 

input(){
            let z=$z+1
	    echo -n "Nomer Nota"
	    read nomor[$z]
            echo -n "Jenis BBM    : "
            read jenis[$z]
            echo -n "Jumlah liter : "
            read liter[$z]
            echo -n "Harga/liter  : Rp."
            read harga[$z]
	    let total[$z]=${liter[$z]}*${harga[$z]}
            echo "Total            : Rp.${total[$z]}"
}
 
view(){
            for((a=1;a<=z;a++))
            do
                        echo "- - -$a- - -"
                        echo "Nomor Nota : ${nomor[$a]}"
                        echo "Jenis BBM  : ${jenis[$a]}"
                        echo "Liter      : ${liter[$a]}"
                        echo "Harga/liter: Rp.${harga[$a]}"
                        echo "Total      : Rp.${total[$a]}"
            done
}
 
search(){
            echo -n "Masukkan Nomor Nota : "
            read cari
            a=0
            b=0
            while [ $a -le $z ] && [ $b == 0 ]
            do
                        let a=$a+1
                        if [ "${nomor[a]}" == $cari ]
                        then
                                    b=1
                        fi
            done
}
 
update(){
            search
            if [ $a -le $z ]
            then
                        echo "Nomor Nota : ${nomor[$a]}"
                        echo "Jenis BBM  : ${jenis[$a]}"
                        echo "Liter      : ${liter[$a]}"
                        echo "Harga/liter: ${harga[$a]}"
                        echo "Total      : ${total[$a]}"
                        echo "- - --- - -"
                        echo -n "Masukkan Nomor Nota   : "
                        read nomor[$a]
                        echo -n "Masukkan Jenis BBM    : "
                        read jenis[$a]
                        echo -n "Masukkan Jumlah liter : "
                        read liter[$a]
                        echo -n "Masukkan Harga/liter  : "
                        read harga[$a]
                        let total[$a]=${liter[$a]}*${harga[$a]}
                        echo "Total                 : ${total[$a]}"
            else
                        echo "Data Tidak Ada"
            fi
}
 
delete(){
            search
            if [ $a -gt $z ]
            then
                        echo "Data Tidak Ada"
            else
                        while [ $a -lt $z ]
                        do
                                    let b=$a+1
                                    nomor[$a]=${nomor[$b]}
                                    jenis[$a]=${jenis[$b]}
                                    liter[$a]=${liter[$b]}
                                    harga[$a]=${harga[$b]}
                                    total[$a]=${total[$b]}
                                    let a=$a+1
                        done
                        let z=$z-1
                        echo "Data $cari Berhasil Dihapus"
            fi
}
 
cetak(){
            search
            if [ $a -le $z ]
            then
                        echo "Nomor Nota : ${nomor[$a]}"
                        echo "Jenis BBM  : ${jenis[$a]}"
                        echo "Liter      : ${liter[$a]}"
                        echo "Harga/liter: ${harga[$a]}"
                        echo "Total      : ${total[$a]}"
            else
                        echo "Data Tidak Ada"
            fi
}
 
	while [ $menu != 6 ]
	do
            echo "1.Input"
	    echo "2.View"
	    echo "3.Update"
	    echo "4.Delete"     
            echo "5.Search"   
	    echo "6.Exit"
            echo -n " : "
            read menu
            if [ $menu -eq 1 ]
            then
                        input  
            elif [ $menu -eq 2 ]
            then
                        if [ $z -lt 1 ]
                        then
                                    echo "kosong "
                        else
                                    view
                        fi
            elif [ $menu -eq 3 ]
            then
                        update          
            elif [ $menu -eq 4 ]
            then
                        delete
            elif [ $menu -eq 5 ]
            then
                        cetak
            elif [ $menu -eq 6 ]
            then
                        echo "Keluar"          
            else
                        echo "Salah "
            fi
            echo ""
	done
   fi
   if [ $pilih == 7 ]
      then
	echo "1. exit biasa"
	echo "2. exit (restart)"
        echo "3. exit (shutdown)"
	read pilihExit
	clear

		if [ $pilihExit == 1 ]
			then
				exit
		fi

		if [ $pilihExit == 2 ]
			then
				sudo reboot	
   		fi

		if [ $pilihExit == 3 ]
			then
				sudo poweroff	
   		fi
   fi

done
