#!/usr/bin/bash
OFFSETS=$(grep Tool ~/printer_data/logs/klippy.log | grep offset |tail -3 | cut -d ' ' -f 5)
myArray=($(echo $OFFSETS |tr "\n" "\r"))

for i in "${myArray[@]}"
do 
  echo $i
done

one_x_offset=$(echo ${myArray[0]} |cut -d ',' -f 1)
one_y_offset=$(echo ${myArray[0]} |cut -d ',' -f 2)
one_z_offset=$(echo ${myArray[0]} |cut -d ',' -f 3)
two_x_offset=$(echo ${myArray[1]} |cut -d ',' -f 1)
two_y_offset=$(echo ${myArray[1]} |cut -d ',' -f 2)
two_z_offset=$(echo ${myArray[1]} |cut -d ',' -f 3)
three_x_offset=$(echo ${myArray[2]}  |cut -d ',' -f 1)
three_y_offset=$(echo ${myArray[2]} |cut -d ',' -f 2)
three_z_offset=$(echo ${myArray[2]} |cut -d ',' -f 3)

sed -ie "s/^one_x_offset =.*/one_x_offset = ${one_x_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^one_y_offset =.*/one_y_offset = ${one_y_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^one_z_offset =.*/one_z_offset = ${one_z_offset}/" ~/printer_data/config/variables.cfg

sed -ie "s/^two_x_offset =.*/two_x_offset = ${two_x_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^two_y_offset =.*/two_y_offset = ${two_y_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^two_z_offset =.*/two_z_offset = ${two_z_offset}/" ~/printer_data/config/variables.cfg

sed -ie "s/^three_x_offset =.*/three_x_offset = ${three_x_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^three_y_offset =.*/three_y_offset = ${three_y_offset}/" ~/printer_data/config/variables.cfg
sed -ie "s/^three_z_offset =.*/three_z_offset = ${three_z_offset}/" ~/printer_data/config/variables.cfg

