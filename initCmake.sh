#!/bin/bash
version=$1
ramDir=/dev/shm/opencv/build
mkdir -p ${ramDir}
#mkdir -p ./${version}/build
ln -s ${ramDir} ${version}/build
cd ${version}/build
cmake -G "Unix Makefiles" --build . \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DOPENCV_EXTRA_MODULES_PATH=~/work/src_opencv/${version}/opencv_contrib/modules  \
        -DCPACK_BINARY_DEB=ON \
        -DCPACK_BINARY_STGZ=OFF -DCPACK_BINARY_TGZ=OFF -DCPACK_BINARY_TXZ=OFF -DCPACK_BINARY_TZ=OFF \
        -DCPACK_SOURCE_TBZ2=OFF -DCPACK_SOURCE_TGZ=OFF -DCPACK_SOURCE_TXZ=OFF -DCPACK_SOURCE_TZ=OFF -DCPACK_SOURCE_ZIP=OFF \
        -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_EXAMPLES=ON  -DOPENCV_GENERATE_PKGCONFIG=ON \
        -DBUILD_JAVA=OFF -DBUILD_opencv_java_bindings_generator=OFF \
        -DBUILD_opencv_js=OFF -DBUILD_opencv_js_bindings_generator=OFF -DBUILD_opencv_objc_bindings_generator=OFF \
        -DBUILD_opencv_python_tests=OFF -DBUILD_opencv_python2=OFF \
        -DPYTHON2_LIBRARY:FILEPATH="" -DPYTHON2_NUMPY_INCLUDE_DIRS="" \
        -DPYTHON2_PACKAGES_PATH:PATH="" -DPYTHON2_EXECUTABLE:FILEPATH="" -DPYTHON2_INCLUDE_DIR:PATH="" \
        -DPYTHON3_PACKAGES_PATH:PATH="/usr/lib/python3/dist-packages" \
        -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH="/usr/lib/python3/dist-packages/numpy/core/include" \
        -DBUILD_TBB=OFF -DWITH_TBB=OFF -DWITH_OPENMP=ON \
        -DWITH_1394=OFF -DWITH_JASPER=OFF -DWITH_OPENXR=OFF -DWITH_VTK=OFF -DWITH_WEBP=OFF -DWITH_TIFF=OFF -DWITH_OPENJPEG=OFF -DWITH_TESSERACT=OFF \
        -DWITH_CUDA=ON -DOPENCV_DNN_CUDA=ON -DWITH_NVCUVID=ON \
           ~/work/src_opencv/${version}/opencv

