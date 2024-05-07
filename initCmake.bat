@echo off
setlocal enabledelayedexpansion
cd %~dp0
set src_top_dir=%1
set output_dir=%2
set CHECK_ARGS=TRUE 
if "%src_top_dir%"=="" set CHECK_ARGS=FALSE
if "%output_dir%"==""  set CHECK_ARGS=FALSE
if %CHECK_ARGS%==FALSE (
  echo ERROR: Too few arguments.
  echo USAGE: %~0 src_top_dir output_dir
  exit /b 1
)

;set extra_modules_path=%src_top_dir%\opencv_contrib\modules\
set extra_modules_path=
set options=%options% -DBUILD_PACKAGE=OFF
set options=%options% -DBUILD_DOCS=OFF
;set options=%options% -DBUILD_PROTOBUF=OFF
set options=%options% -DBUILD_EXAMPLES=ON
set options=%options% -DBUILD_JASPER=OFF
set options=%options% -DBUILD_JAVA=OFF
set options=%options% -DBUILD_opencv_js=OFF
set options=%options% -DBUILD_OPENEXR=OFF
set options=%options% -DBUILD_OPENJPEG=OFF
set options=%options% -DBUILD_TESTS=OFF
set options=%options% -DBUILD_PERF_TESTS=OFF
set options=%options% -DBUILD_TIFF=OFF
set options=%options% -DBUILD_WEBP=OFF
set options=%options% -DBUILD_opencv_java_bindings_generator=OFF
set options=%options% -DBUILD_opencv_js_bindings_generator=OFF
set options=%options% -DOPENCV_GAPI_GSTREAMER=OFF
set options=%options% -DOPENCV_GAPI_WITH_OPENVINO=OFF
set options=%options% -DENABLE_LTO=OFF
set options=%options% -DOPENCV_GENERATE_PKGCONFIG=ON
set options=%options% -DWITH_LAPACK=OFF
set options=%options% -DBUILD_opencv_objc_bindings_generator=OFF



set options=%options% -DCPACK_SOURCE_ZIP=OFF
set options=%options% -DCPACK_BINARY_NSIS=OFF
set options=%options% -DCPACK_SOURCE_7Z=OFF

rem set options=%options% -DOPENCV_PYTHON3_VERSION=ON
set options=%options% -DBUILD_opencv_python3=ON
set options=%options% -DBUILD_opencv_python_bindings_generator=ON
set options=%options% -DBUILD_opencv_python_tests=OFF


set options=%options% -DBUILD_opencv_ts=ON
set options=%options% -DBUILD_opencv_world=ON

set options=%options% -DINSTALL_BIN_EXAMPLES=ON
set options=%options% -DINSTALL_PYTHON_EXAMPLES=ON
set options=%options% -DINSTALL_C_EXAMPLES=ON

set options=%options% -DWITH_1394=OFF
set options=%options% -DWITH_JASPER=OFF
set options=%options% -DWITH_OPENCL_SVM=ON
;set options=%options% -DWITH_PROTOBUF=OFF

rem Contrib modules:
set options=%options% -DBUILD_opencv_bioinspired=OFF
set options=%options% -DBUILD_opencv_img_hash=OFF
set options=%options% -DBUILD_opencv_hfs=OFF
set options=%options% -DWITH_TESSERACT=OFF
set options=%options% -DBUILD_opencv_wechat_qrcode=OFF
set options=%options% -DBUILD_opencv_fuzzy=OFF
set options=%options% -DWITH_OBSENSOR=OFF

set options=%options% -DWITH_FFMPEG=ON
set options=%options% -DWITH_GSTREAMER=ON
set options=%options% -DWITH_LAPACK=OFF
set options=%options% -DWITH_OPENEXR=OFF
set options=%options% -DWITH_VTK=OFF
set options=%options% -DWITH_VULKAN=OFF

rem Libraries of image file format:
set options=%options% -DWITH_TIFF=OFF
set options=%options% -DWITH_WEBP=OFF
set options=%options% -DWITH_OPENJPEG=OFF
set options=%options% -DWITH_OPENGL=ON

rem Eigen:
set options=%options% -DWITH_EIGEN=ON
set options=%options% -DEIGEN_INCLUDE_PATH:PATH="C:/buildingOpencv/eigen-3.4.0"
set options=%options% -DEigen3_DIR:PATH="C:/buildingOpencv/eigen-3.4.0/Eigen"

rem OpenVino:
set options=%options% -DWITH_OPENVINO=ON
set options=%options% -DWITH_INF_ENGINE=ON
set options=%options% -DInferenceEngine_DIR:PATH="C:/ProgramData/openvino_2022/runtime/cmake"
set options=%options% -DOPENCV_TEST_DNN_OPENVINO=OFF
set options=%options% -DOPENCV_TEST_DNN_TFLITE=OFF

rem Plugin:
set options=%options% -DDNN_ENABLE_PLUGINS=ON
set options=%options% -DDNN_PLUGIN_LIST:STRING="openvino"
set options=%options% -DHIGHGUI_ENABLE_PLUGINS=OFF
set options=%options% -DVIDEOIO_ENABLE_PLUGINS=ON
set options=%options% -DVIDEOIO_PLUGIN_LIST:STRING="ffmpeg,gstreamer,msmf"

md %output_dir%
cmake -G "Visual Studio 16 2019" -A "x64" -S %src_top_dir%\opencv\ -B %output_dir% -DOPENCV_EXTRA_MODULES_PATH=%extra_modules_path% %options%


