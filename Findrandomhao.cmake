#Try to find randomhao
set(libhao_path "$ENV{LIBHAO}")
find_library(randomhao_libraries   NAMES  librandomhao.a    PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_path(randomhao_include_dirs random_hao.h PATHS "${libhao_path}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(randomhao  DEFAULT_MSG
                                  randomhao_libraries randomhao_include_dirs)
mark_as_advanced(randomhao_include_dirs randomhao_libraries)

if(NOT RANDOMHAO_FOUND)
  MESSAGE ("-- In order to find randomhao, please define LIBHAO='/path/to/libhao' ")
endif()
