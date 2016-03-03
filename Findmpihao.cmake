#Try to find mpihao
set(libhao_path "$ENV{LIBHAO}")
find_library(mpihao_libraries   NAMES  libmpihao.a    PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_path(mpihao_include_dirs mpi_fun.h PATHS "${libhao_path}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(mpihao  DEFAULT_MSG
                                  mpihao_libraries mpihao_include_dirs)
mark_as_advanced(mpihao_include_dirs mpihao_libraries)

if(NOT MPIHAO_FOUND)
  MESSAGE ("-- In order to find mpihao, please define LIBHAO='/path/to/libhao' ")
endif()
