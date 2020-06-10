######################################
# INSTALL OPENCV ON UBUNTU OR DEBIAN #
######################################

# -------------------------------------------------------------------- |
#                       SCRIPT OPTIONS                                 |
# ---------------------------------------------------------------------|
OPENCV_VERSION='4.1.2'       # Version to be installed
OPENCV_CONTRIB='YES'          # Install OpenCV's extra modules (YES/NO)
# -------------------------------------------------------------------- |

# |          THIS SCRIPT IS TESTED CORRECTLY ON          |
# |------------------------------------------------------|
# | OS               | OpenCV       | Test | Last test   |
# |------------------|--------------|------|-------------|
# | Debian 10.1      | OpenCV 4.1.1 | OK   | 28 Sep 2019 |
# |----------------------------------------------------- |
# | Ubuntu 18.04 LTS | OpenCV 4.1.0 | OK   | 22 Jun 2019 |
# | Debian 9.9       | OpenCV 4.1.0 | OK   | 22 Jun 2019 |
# |----------------------------------------------------- |
# | Ubuntu 18.04 LTS | OpenCV 3.4.2 | OK   | 18 Jul 2018 |
# | Debian 9.5       | OpenCV 3.4.2 | OK   | 18 Jul 2018 |



# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
# sudo apt-get -y upgrade       # Uncomment to install new versions of packages currently installed
# sudo apt-get -y dist-upgrade  # Uncomment to handle changing dependencies with new vers. of pack.
# sudo apt-get -y autoremove    # Uncomment to remove packages that are now no longer needed


# 2. INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI (if you want GTK, change 'qt5-default' to 'libgtkglext1-dev' and remove '-DWITH_QT=ON'):
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev \
                        libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev \
                        libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm \
                        libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev  python-tk  pylint  python-numpy  \
                        python3-dev python3-tk pylint3 python3-numpy flake8

# Java:
sudo apt-get install -y ant default-jdk

# Documentation and other:
sudo apt-get install -y doxygen unzip wget


# 3. INSTALL THE LIBRARY

wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip
unzip ${OPENCV_VERSION}.zip && rm ${OPENCV_VERSION}.zip
mv opencv-${OPENCV_VERSION} OpenCV

if [ $OPENCV_CONTRIB = 'YES' ]; then
  wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip
  unzip ${OPENCV_VERSION}.zip && rm ${OPENCV_VERSION}.zip
  mv opencv_contrib-${OPENCV_VERSION} opencv_contrib
  mv opencv_contrib OpenCV
fi

cp /usr/local/cuda-10.1/targets/x86_64-linux/include/cuda_fp16.h OpenCV/opencv_contrib/modules/cudev/include/opencv2/cudev

cd OpenCV && mkdir build && cd build


if [ $OPENCV_CONTRIB = 'NO' ]; then
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON \
      -D WITH_CUDA=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=ON \
      -D BUILD_opencv_python_bindings_generator=ON \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D PYTHON_EXECUTABLE=~/anaconda3zs/bin/python \
      -D PYTHON3_PACKAGES_PATH=~/anaconda3/lib/python3.7/site-packages \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=~/anaconda3/lib/python3.7/site-packages/numpy/core/include \
      -D BUILD_EXAMPLES=ON -D BUILD_NEW_PYTHON_SUPPORT=ON \
      -DWITH_XINE=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
fi

if [ $OPENCV_CONTRIB = 'YES' ]; then
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DWITH_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON \
      -DWITH_XINE=ON -DENABLE_PRECOMPILED_HEADERS=OFF \
      -D PYTHON_EXECUTABLE=/home/josephkchin/anaconda3/bin/python \
      -D PYTHON_DEFAULT_EXECUTABLE=/home/josephkchin/anaconda3/bin/python3 \
      -D PYTHON3_INCLUDE_DIR=/home/josephkchin/anaconda3/include/python3.7m \
      -D PYTHON3_LIBRARY=/home/josephkchin/anaconda3/lib/libpython3.7m.so \
      -D PYTHON3_PACKAGES_PATH=/home/josephkchin/anaconda3/lib/python3.7/site-packages \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/home/josephkchin/anaconda3/lib/python3.7/site-packages/numpy/core/include \
      -D BUILD_EXAMPLES=OFF -D BUILD_NEW_PYTHON_SUPPORT=ON \
      -D OPENCV_ENABLE_MEMORY_SANITIZER=ON \
      -D WITH_TIFF=ON -D BUILD_TIFF=ON  \
      -D WITH_CUDA=ON \
      -D WITH_FFMPEG=ON \
      -D WITH_CUDNN=ON \
      -D WITH_EIGEN=ON \
      -D OPENCV_DNN_CUDA=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUBLAS=1 \
      -D CUDA_GENERATION=Turing \
      -D CUDA_NVCC_FLAGS=--expt-relaxed-constexpr \
      -D CUDA_FAST_MATH=1 \
      -D CMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs \
      -D BUILD_opencv_cudacodec=OFF \
      -D CMAKE_BUILD_TYPE=Release \
      -D WITH_GSTREAMER=ON \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=ON \
      -D WITH_V4L=ON \
      -D BUILD_opencv_apps=ON \
      -D BUILD_opencv_calib3d=ON \
      -D BUILD_opencv_core=ON \
      -D BUILD_opencv_dnn=ON \
      -D BUILD_opencv_features2d=ON \
      -D BUILD_opencv_flann=ON \
      -D BUILD_opencv_gapi=ON \
      -D BUILD_opencv_highgui=ON \
      -D BUILD_opencv_imgcodecs=ON \
      -D BUILD_opencv_imgproc=ON \
      -D BUILD_opencv_java=OFF \
      -D BUILD_opencv_java_bindings_generator=OFF \
      -D BUILD_opencv_js=OFF \
      -D BUILD_opencv_ml=ON \
      -D BUILD_opencv_objdetect=ON \
      -D OPENCV_GENERATE_PKGCONFIG=ON \
      -D BUILD_opencv_photo=ON \
      -D BUILD_opencv_stitching=ON \
      -D BUILD_opencv_ts=ON \
      -D BUILD_opencv_video=ON \
      -D BUILD_opencv_videoio=ON \
      -D BUILD_opencv_world=OFF \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D ENABLE_FAST_MATH=1 \
      -D ENABLE_PYLINT=ON \
      -D INSTALL_TESTS=ON \
      -D BUILD_opencv_python_bindings_generator=ON \
      -D OPENCV_EXTRA_MODULES_PATH=/home/josephkchin/git/OpenCV/opencv_contrib/modules ..
fi

make -j $(($(nproc) + 1))
sudo make  -j $(($(nproc) + 1)) install
sudo ldconfig
cd ~/anaconda3/lib/python3.7/site-packages/cv2/python-3.7
sudo mv cv2.cpython-37m-x86_64-linux-gnu.so cv2.so

cd ~/anaconda3/lib
rm libfontconfig.so libfontconfig.so.1 libfontconfig.so.1.11.1 libpangoft2-1.0.so.0 libpangoft2-1.0.so.0.4200.4





