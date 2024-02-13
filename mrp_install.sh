
git clone https://github.com/boschresearch/mrp_bench src/mrp_bench

sudo apt install -y ros-galactic-navigation2 ros-galactic-nav2-bringup ros-galactic-nav2-gazebo-spawner ros-galactic-turtlebot3*

wget https://raw.githubusercontent.com/open-rmf/rmf/galactic/rmf.repos src/rmf.repos
vcs import < src/rmf.repos src

cd /workspaces/ws_open_rmf_galactic/src
git clone --depth 1 https://github.com/open-rmf/free_fleet.git src/free_fleet --branch ros2


cd /workspaces/ws_open_rmf_galactic/src/thirdparty/pybind11_json_vendor
git checkout tags/0.4.0 

cd /workspaces/ws_open_rmf_galactic/src/thirdparty/nlohmann_json_schema_validator_vendor
git checkout f5fca6cdb98748e372d519f3ab2601e14fa30c06
