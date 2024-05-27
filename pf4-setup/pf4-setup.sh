#!/usr/bin/bash

cd ~
mkdir -p git
cd git
git clone -b main --single-branch  https://github.com/Makertech3D/Proforge-4 Proforge-4@Makertech3D
git clone git@github.com:Jornack/Proforge-4.git
git clone https://github.com/mainsail-crew/moonraker-timelapse.git
git clone https://github.com/dw-0/kiauh.git

cd Proforge-4

cp -v Proforge\ 4\ Klipper\ Config\ Files/* ~/printer_data/config
cp -v .config ~/klipper/


OCTO_SERIAL_ID=$(ls /dev/serial/by-id/*stm32h723*)
sed -ie "s@^serial:.*@serial: ${OCTO_SERIAL_ID}@" ~/printer_data/config/printer.cfg
sed -ie "s/^#\[include Orbiter/\[include Orbiter/g" ~/printer_data/config/printer.cfg 


sed -e '/\[filament_switch_sensor filament_sensor.*/,/^$/ s/^/# /'  ~/printer_data/config/printer.cfg

cp Auto-Calibration\ Probe\ Code/tools_calibrate.py ~/klipper/klippy/extras/

sed -ie "s/G0 X200 Y267 F10000/G0 X202 Y273 F10000/" ~/printer_data/config/calibrate-offsets.cfg 
 