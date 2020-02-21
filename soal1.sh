#!/bin/bash

#(a)
echo "a) Region profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2{print$1}'

#(b)
echo "b) 2 State profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$11] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2  | awk 'FNR < 3{printf"%s \n", $1$2$3$4$5$6}'

#(c)
echo "c) 10 nama Produk profit terkecil: "
awk -F'\t' '{if($11 =="District of Columbia" && $11 =="New Hampshire") FNR > 1{SUM[$17] +=$18} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2  | awk 'FNR < 11{printf $1$2$3$4$5$6$7$8$9}'