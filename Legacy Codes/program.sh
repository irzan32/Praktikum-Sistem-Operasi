echo "Konvenersi Waktu" 
echo "masukkan detik yang akan di konversi("jam","menit","detik")"
read dtk


let jam=$dtk/3600
let sec=$dtk-$(expr 3600*$jam)
let menit=$dtk/60
let dtk=$dtk-$(expr 60*menit)

if [ $jam != 0 ]
then
jamo="$jam jam"
else
jamo=" "
fi


if [ $menit != 0 ]
then
menito="$menit menit"
else
menito=" "
fi


if [ $dtk != 0 ]
then
dtko="$dtk detik"
else
dtko=" "
fi


echo "$jamo $menito $dtko"

