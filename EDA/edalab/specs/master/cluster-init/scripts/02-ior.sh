#!/bin/bash
chmod 777 /projects
set -x
SOFTWARE_DIR=$(jetpack config io.install_dir)
mkdir -p $SOFTWARE_DIR
cd $SOFTWARE_DIR/
yum -y install git automake

git clone https://github.com/hpc/ior
cd ior/
source /etc/profile.d/modules.sh
module load mpi/openmpi-4.0.1
./bootstrap 
./configure --prefix=${SOFTWARE_DIR}/ior
make
make install

