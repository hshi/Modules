#Try to find libhao, level 0
find_library(fftwhao_libraries         NAMES  libfftwhao.a           PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(kahanerrhao_libraries     NAMES  libkahanerrhao.a       PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(latticehao_libraries      NAMES  liblatticehao.a        PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(mathhao_libraries         NAMES  libmathhao.a           PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(tensorhao_libraries       NAMES  libtensorhao.a         PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(mpihao_libraries          NAMES  libmpihao.a            PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(randomhao_libraries       NAMES  librandomhao.a         PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
find_library(timehao_libraries         NAMES  libtimehao.a           PATHS "$ENV{LIBHAO}/lib" NO_DEFAULT_PATH)
set(libhao0_libraries ${fftwhao_libraries} ${kahanerrhao_libraries}  ${latticehao_libraries}  ${mathhao_libraries} 
                     ${tensorhao_libraries} ${mpihao_libraries} ${randomhao_libraries} ${timehao_libraries} )
find_path(libhao0_include_dirs time_hao.h PATHS "$ENV{LIBHAO}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libhao0  DEFAULT_MSG
                                  libhao0_libraries libhao0_include_dirs)
mark_as_advanced(libhao0_include_dirs libhao0_libraries)

if(NOT LIBHAO0_FOUND)
  MESSAGE ("-- In order to find libhao, please define LIBHAO='/path/to/libhao' ")
endif()
