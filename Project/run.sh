#!/bin/bash
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
