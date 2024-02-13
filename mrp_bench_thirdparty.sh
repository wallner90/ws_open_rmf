# install libMultiRobotPlanning
mkdir mrp_thirdparty
cd mrp_thirdparty
TP_BASE=$(pwd)

git clone --depth 1 https://github.com/whoenig/libMultiRobotPlanning.git
mkdir libMultiRobotPlanning/build
cd libMultiRobotPlanning/build
cmake .. && make

cd $TP_BASE

# install EECBS
git clone --depth 1 https://github.com/Jiaoyang-Li/EECBS.git
cd EECBS 
cmake -DCMAKE_BUILD_TYPE=RELEASE . 
make