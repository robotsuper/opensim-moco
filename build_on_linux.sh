#/bin/bash

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# 先配置 ssh-keygen ，到github，https://github.com/settings/ssh/new，因为里面改成了 git ssh
# git submodule update --init

mkdir ../moco_dependencies_build
cd ../moco_dependencies_build
cmake ../opensim-moco/dependencies
make -j16 ipopt
make -j16

cd ../opensim-moco 
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/_install_
make -j32
make install

cd ..
