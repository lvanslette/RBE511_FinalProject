#!/bin/bash
cd /home/lvanslette/WPI/RBE511_FinalProject/Project
if [ ! -d "build" ]; then
   echo "running CMake..."
   mkdir build
   cd build
   cmake ..
   cd ..
fi
cd build
make -j8
cd ..
argos3 -c project_model.argos
