# SoalShiftSISOP20_modul1_T10

## Jawaban Soal Shift Sistem Operasi 2020

## Modul 1

Oleh: 

* 05311840000020 Milenia Ulwan Zafira
* 05311840000042 I Komang Aditya Mahadiharja

## Daftar Isi
* [1. Filter Data dengan AWK](##1-filter-data-dengan-awk)
* [3. PDKT Kusuma](#3-pdkt-kusuma)
- - - 

## 1. Filter Data dengan AWK
### soal1.sh
```
#!/bin/bash

#(a)
echo "a) Region profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2{print$1}'

#(b)
echo "b) 2 State profit terkecil: "
awk -F"\t" 'FNR > 1{if($13 =="Central" ){SUM[$11] +=$21}} END{for (j in SUM) print j","SUM[j]| "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 2

#(c)
echo "c) 10 nama Produk profit terkecil: "
awk -F"\t" 'FNR>1{if(($11 =="Texas" || $11 =="Illinois")&& $13 == "Central"){SUM[$17]+=$21;}} END {for (j in SUM) print j"="SUM[j] | "sort -t '=' -g -k2" }' Sample-Superstore.tsv | head -n 10
```
Penjelasan<br />
Soal<br />
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.<br />
a.Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit<br />
b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a<br />
c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b<br />

Solusi:<br />
a. menentukan region pada $13 yang memiliki profit $21 paling kecil dengan ``awk -F'\t' 'FNR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' `` lalu sorting dan print ``| sort -gk2 | awk 'FNR < 2{print$1}'``<br />
b. menentukan state pada $11 yang memiliki profit paling kecil dangan serta disorting ``awk awk -F"\t" 'FNR > 1{if($13 =="Central" ){SUM[$11] +=$21}} END{for (j in SUM) print j","SUM[j]| "sort -t ',' -g -k2"}'`` print 2 state dengan nilainya ``head -n 2``<br />
c. setelah ditemukan di 1b bahwa state profit terkecil adalah District of Columbia dan New Hampshire maka dibuat code yang sekalian sorting ``awk -F"\t" 'FNR>1{if(($11 =="Texas" || $11 =="Illinois")&& $13 == "Central"){SUM[$17]+=$21;}} END {for (j in SUM) print j"="SUM[j] | "sort -t '=' -g -k2" }'`` dan print 10 nilai ``head -n 10``
![Output Soal 1](https://raw.githubusercontent.com/MilenFifi/SoalShiftSISOP20_modul1_T10/master/1.PNG)

## 3. PDKT Kusuma
#### soal3.sh
```
#!/bin/bash

tes=`ls | grep "pdkt_kusuma_" | cut -d "_" -f 3 | sort -n | tail -1`
echo $tes

if [[ $tes < 1 ]]
then
tes=0
fi

a=`expr $tes + 1`
b=`expr $tes + 28`

for ((i=a;i<b;i=i+1))
do
wget -a wget.log -O "pdkt_kusuma_$i" https://loremflickr.com/320/240/cat
done
```
#### crontab
```
5 6-23/8 * * 0-5  /home/milenfifi/Downloads/soal3.sh
```
Penjelasan<br />
Soal<br />
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati
kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang
sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma,
kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. <br />
a. Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari
"https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file
dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2,
pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam
sebuah file "wget.log". <br />
b. setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu<br />
c.Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan
gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka
sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate
dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201).
Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan
dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253).
Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi
ekstensi ".log.bak". <br />

Solusi:<br />
a. ``tes=`ls | grep "pdkt_kusuma_" | cut -d "_" -f 3 | sort -n | tail -1`` ini berfungsi sebagai penamaan pada file yang diambil dari link ini dengan fungsi wget ``wget -a wget.log -O "pdkt_kusuma_$i" https://loremflickr.com/320/240/cat`` dengan penomorannya dilakukan dengan coding selain diatas dilooping sampai ketentuan yang ditentukan<br />
![Output Soal 3a](https://raw.githubusercontent.com/MilenFifi/SoalShiftSISOP20_modul1_T10/master/3a.PNG)
b. 5, pada menit ke-5. 6-23/8, mulai jam 6-23 per 8 jam sekali * * 0-5, pada hari minggu-jum'at tanpa sabtu yang dalam nomer yaitu 6<br />
![Output Soal 3b](https://raw.githubusercontent.com/MilenFifi/SoalShiftSISOP20_modul1_T10/master/3b.PNG)
c. belum