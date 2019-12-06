declare -a array_nama
declare -a array_npm
declare -a array_jurusan
declare -a array_semester
declare -a array_matakuliah
declare -a array_nilaimk
index=0;
index_mk=0;
data=0;
while :; do
echo "1. Masukan Nilai"
echo "2. Liat data mahasiswa"
echo "3. Tambah Data matkul"
echo "4. Hasil data mahasiswa + nilai ip"
echo "5. Exit"
echo "Masukkan pilihan anda : "
read pilihan 

input(){
    clear
    echo "masukkan data :"
    read data
    
    for ((i=$1;i<$(( data+$1 ));i++))
    do
        echo "Masukkan Nama Mahasiswa : "
        read nama
        array_nama[$i]+=$nama
        echo "Masukkan NPM Mahasiswa : "
        read npm
        array_npm[$i]+=$npm
        echo "Masukkan Jurusan : "
        read jurusan
        array_jurusan[$i]+=$jurusan
        echo "Masukkan Semester : "
        read semester
        array_semester[$i]+=$semester
        let index+=1
    done
    }

view(){
    clear
    for ((i=0;i<index;i++))
    do
    echo "========= Data Mahasiswa Ke - $(( $i+1 )) ========="
        echo "Nama Mahasiswa : ${array_nama[$i]}"
        echo "NPM Mahasiswa : ${array_npm[$i]}"
        echo "Jurusan Mahasiswa : ${array_jurusan[$i]}"
        echo -e "Semester : ${array_semester[$i]} \n"
    done
}

tambah (){
    echo "Masukkan NPM mahasiswa : "
    read cari
	for(( i=0 ; i<data ; i++))
	do
        	if [ $cari==${array_npm[$i]} ]
            	then
			echo "Nama : ${array_nama[$i]}"
                	for ((i=0;i<4;i++))
                	do
                	    if [ $i == 0 ]
                	    then
                	        echo "Sistem Operasi : "
                	        read nilaimk
                	    elif [ $i == 1 ]
                	    then
                	        echo "Pemrograman Lanjut : "
                	        read nilaimk
                	    elif [ $i == 2 ]
                	    then
                	        echo "Bela Negara : "
                	        read nilaimk
                	    elif [ $i == 3 ]
                	    then
                	        echo "Stastistik Komputasi : "
                	        read nilaimk
                	    fi
                	    array_nilaimk[$i]+=$nilaimk 
                	done
                	if [ $index_mk -eq 0 ]
                	then
                	    echo "Data Valid"
                	else 
                	    echo "Data Invalid"
                	fi 
        	else 
        	echo "Tidak Valid"                  
        	fi
	done
}
rata (){
    clear
    rata1=0
    for ((i=$1;i<index_mk;i++))
    do
        echo "===== Data Mahasiswa Ke - $(( $i+1 )) ====="
        for ((j=0;j<4;j++))
        do
            let rata1+=array_nilaimk[$j]
        done
            let total=$rata1/4
            echo "IP Mahasiswa : $total"
    done
}

if [ $pilihan == 1 ]
then    
    input $index
elif [ $pilihan == 2 ]
then 
    view 
elif [ $pilihan == 3 ]
then
    tambah 
elif [ $pilihan == 4 ]
then
    rata $index_mk
else 
    exit
fi

done
