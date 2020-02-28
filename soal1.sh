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
