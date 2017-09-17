#!/bin/bash

for i in $(seq 9); do
	wget "http://witestlab.poly.edu/bikes/20160$i-citibike-tripdata.zip" | unzip
	awk -F "\"*,\"*" '{print $4}' 20160"$i"-citibike-tripdata.csv >> station_id.txt
done
uniq station_id_sort.txt -c | sort -k1,1nr -k2,2 > counted.txt
head counted.txt
