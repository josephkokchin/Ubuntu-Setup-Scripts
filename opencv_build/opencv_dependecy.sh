sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install build-essential cmake git unzip pkg-config -y
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libavresample-dev libvorbis-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install libgtk2.0-dev libcanberra-gtk* -y
sudo apt-get install x264 libxvidcore-dev libx264-dev libgtk-3-dev -y
sudo apt-get install python3-dev python3-numpy python3-pip -y
sudo apt-get install python3-testresources -y
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev -y
sudo apt-get install libv4l-dev v4l-utils -y
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd ~
sudo apt-get install libxine2-dev -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt-get update
sudo apt-get install libjasper-dev -y
#sudo apt-get install libopenblas-dev -y
sudo apt-get install libatlas-base-dev libblas-dev -y
sudo apt-get install liblapack-dev gfortran -y
sudo apt-get install libhdf5-dev protobuf-compiler -y
#sudo apt-get install libprotobuf-dev -y
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
