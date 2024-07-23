#/bin/bash

# 先配置 ssh-keygen ，到github，https://github.com/settings/ssh/new，因为里面改成了 git ssh
# git submodule update --init

mkdir ../moco_dependencies_build
cd ../moco_dependencies_build
cmake ../opensim-moco/dependencies
make --jobs 16 ipopt
make --jobs 16
cd ../opensim-moco 
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$(pwd)/_install_
make --jobs 16
make install
cd ..
