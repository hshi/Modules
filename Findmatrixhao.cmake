#Try to find matrixhao
set(matrixhao_path "$ENV{LIBHAO}")
find_library(matrixhao_libraries   NAMES  libmatrixhao.a    PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_path(matrixhao_include_dirs matrix_all.h PATHS "${libhao_path}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(matrixhao  DEFAULT_MSG
                                  matrixhao_libraries matrixhao_include_dirs)
mark_as_advanced(matrixhao_include_dirs matrixhao_libraries)

if(NOT MATRIXHAO_FOUND)
  MESSAGE ("-- In order to find matrixhao, please define LIBHAO='/path/to/libhao' ")
endif()
