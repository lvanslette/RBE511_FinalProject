#!/bin/bash
cd /home/lvanslette/WPI/RBE511_FinalProject/build
make -j8
cd ..
argos3 -c movement.argos
echo "copied data.dat to /mnt/hgfs/Shared"
cp ~/WPI/RBE511_FinalProject/data.dat /mnt/hgfs/Shared/
