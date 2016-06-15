#Try to find libhao
set(libhao_path "$ENV{LIBHAO}")
find_library(fftwhao_libraries         NAMES  libfftwhao.a           PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(kahanerrhao_libraries     NAMES  libkahanerrhao.a       PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(latticehao_libraries      NAMES  liblatticehao.a        PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(mathhao_libraries         NAMES  libmathhao.a           PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(matrixhao_libraries       NAMES  libmatrixhao.a         PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(mpihao_libraries          NAMES  libmpihao.a            PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(randomhao_libraries       NAMES  librandomhao.a         PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(timehao_libraries         NAMES  libtimehao.a           PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(threadmcdatahao_libraries NAMES  libthreadmcdatahao.a   PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_library(popcontrolhao_libraries   NAMES  libpopcontrol.a        PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
set(libhao_libraries ${popcontrolhao_libraries} ${threadmcdatahao_libraries} ${fftwhao_libraries} ${kahanerrhao_libraries} 
                     ${latticehao_libraries}    ${mathhao_libraries} ${matrixhao_libraries} ${mpihao_libraries} ${randomhao_libraries} 
                     ${timehao_libraries} )
find_path(libhao_include_dirs time_hao.h PATHS "${libhao_path}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libhao  DEFAULT_MSG
                                  libhao_libraries libhao_include_dirs)
mark_as_advanced(libhao_include_dirs libhao_libraries)

if(NOT LIBHAO_FOUND)
  MESSAGE ("-- In order to find libhao, please define LIBHAO='/path/to/libhao' ")
endif()
