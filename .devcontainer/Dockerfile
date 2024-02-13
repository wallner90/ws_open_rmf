FROM althack/ros2:galactic-cuda-dev 

# ** [Optional] Uncomment this section to install additional packages. **
#
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
   && apt-get -y install --no-install-recommends  \
   python3-pip wget lsb-release gnupg curl python3-colcon-mixin ros-dev-tools \ 
   python3-venv \
   git-lfs \
   ignition-fortress \
   ros-galactic-rviz2 \
   ros-galactic-joy \
   ros-galactic-gazebo-plugins \
   ros-galactic-teleop-twist-keyboard \
   ros-galactic-ros-ign-bridge \
   ros-galactic-image-transport-plugins \
   ros-galactic-robot-localization \
   ros-galactic-topic-tools \
   #
   # Clean up
   && apt-get autoremove -y \
   && apt-get clean -y \
   && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

RUN pip install flask-socketio fastapi uvicorn pipenv
# RUN pip install vcstool || pip3 install vcstool
# RUN pip install -U colcon-common-extensions || pip3 install -U colcon-common-extensions

# Set up auto-source of workspace for ros user
ARG WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/install/setup.bash ]; then source ${WORKSPACE}/install/setup.bash; fi" >> /home/ros/.bashrc

# # setup gazebo / ignition model cache to be persistent over docker rebuilds
# RUN mkdir -p /home/ros/.ignition/fuel/fuel.gazebosim.org && \
#     chown -R ros:ros /home/ros/.ignition/fuel/fuel.gazebosim.org

################
# uncomment below for nvidia support
# Expose the nvidia driver to allow opengl 
# Dependencies for glvnd and X11.
################
RUN apt-get update \
 && apt-get install -y -qq --no-install-recommends \
  libglvnd0 \
  libgl1 \
  libglx0 \
  libegl1 \
  libxext6 \
  libx11-6 \
&& rm -rf /var/lib/apt/lists/*

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

ENV QT_X11_NO_MITSHM=1
