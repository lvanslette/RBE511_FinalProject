#!/bin/bash
if [ ! -d "build" ]; then
   mkdir build
   cd build
   cmake ..
   cd ..
fi
cd build
make -j8
cd ..
argos3 -c movement.argos
