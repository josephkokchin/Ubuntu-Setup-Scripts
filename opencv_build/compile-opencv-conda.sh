cd opencv && mkdir build && cd build;

cmake -DWITH_QT=ON -DWITH_VTK=ON -DWITH_GDAL=ON \
      -DWITH_XINE=ON -DENABLE_PRECOMPILED_HEADERS=OFF \
      -D OPENCV_ENABLE_MEMORY_SANITIZER=ON \
      -D BUILD_LIBPROTOBUF_FROM_SOURCES=ON \
      -D CMAKE_C_COMPILER=/usr/bin/gcc-7 \
      -D WITH_TIFF=ON -D BUILD_TIFF=ON  \
      -D WITH_CUDA=ON \
      -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-10.2 \
      -D VTK_DIR=/usr/local/lib/cmake/vtk-9.0/ \
      -D WITH_NVCUVID=ON \
      -D WITH_MFX=ON \
      -D WITH_TBB=ON \
      -D WITH_IPP=ON \
      -D MKL_USE_MULTITHREAD=ON -DMKL_WITH_TBB=ON \
      -D WITH_FFMPEG=ON \
      -D WITH_CUDNN=ON \
      -D WITH_EIGEN=ON \
      -D OPENCV_DNN_CUDA=ON \
      -D WITH_OPENGL=ON \
      -D WITH_CUBLAS=1 \
      -D CUDA_GENERATION=Turing \
      -D CUDA_ARCH_PTX=7.5 \
      -D CUDA_ARCH_BIN=5.3,6.0,6.1,7.0,7.5 \
      -D CUDA_NVCC_FLAGS=--expt-relaxed-constexpr \
      -D CUDA_FAST_MATH=1 \
      -D CMAKE_LIBRARY_PATH=/usr/local/cuda/lib64/stubs \
      -D BUILD_opencv_cudacodec=ON \
      -D CMAKE_BUILD_TYPE=Release \
      -D WITH_GSTREAMER=ON \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=ON \
      -D PYTHON3_EXECUTABLE=/opt/anaconda3/bin/python3 \
      -D PYTHON_DEFAULT_EXECUTABLE=/opt/anaconda3/bin/python3 \
      -D PYTHON3_INCLUDE_DIR=/opt/anaconda3/include/python3.7m \
      -D PYTHON3_LIBRARY=/opt/anaconda3/lib/libpython3.7m.so \
      -D PYTHON3_PACKAGES_PATH=/opt/anaconda3/lib/python3.7/site-packages \
      -D PYTHON3_NUMPY_INCLUDE_DIRS=/opt/anaconda3/lib/python3.7/site-packages/numpy/core/include \
      -D BUILD_opencv_python_bindings_generator=ON \
      -D BUILD_EXAMPLES=OFF -D BUILD_NEW_PYTHON_SUPPORT=ON \
      -D WITH_V4L=ON \
      -D WITH_LIBV4L=ON \
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
      -D OPENCV_EXTRA_MODULES_PATH=/home/josephkchin/opencv/opencv_contrib/modules ..


make -j $(($(nproc) + 1))
sudo make  -j $(($(nproc) + 1)) install
sudo ldconfig
cd /opt/anaconda3/lib/python3.7/site-packages/cv2/python-3.7
sudo mv cv2.cpython-37m-x86_64-linux-gnu.so cv2.so

#cd /opt/anaconda3/lib
#rm libfontconfig.so libfontconfig.so.1 libfontconfig.so.1.11.1 libpangoft2-1.0.so.0 libpangoft2-1.0.so.0.4200.4









