#!/bin/bash
# This is for trimming a batch data
for i in a1 a2 a3 b1 b2 b3 c1 c2 c3
do
    trim_galore -q 20 --phred33 --clip_R1 15 --clip_R2 15 --paired ${i}_1.fq.gz ${i}_2.fq.gz --gzip -o /data_t/bioinformatics/zjj12023128023/rnaseq/02clean_data/trim_galoredata
done
