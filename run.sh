#!/bin/bash
cd /home/lvanslette/WPI/RBE511_HW10/build
make -j8
cd ..
argos3 -c threshold_model.argos
echo "copied data.dat to /mnt/hgfs/Shared"
cp ~/WPI/RBE511_HW10/data.dat /mnt/hgfs/Shared/
