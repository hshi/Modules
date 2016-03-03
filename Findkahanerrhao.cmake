#Try to find kahanerrhao
set(kahanerrhao_path "$ENV{LIBHAO}")
find_library(kahanerrhao_libraries   NAMES  libkahanerrhao.a    PATHS "${libhao_path}/lib" NO_DEFAULT_PATH)
find_path(kahanerrhao_include_dirs kahan.h PATHS "${libhao_path}/include" NO_DEFAULT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(kahanerrhao  DEFAULT_MSG
                                  kahanerrhao_libraries kahanerrhao_include_dirs)
mark_as_advanced(kahanerrhao_include_dirs kahanerrhao_libraries)

if(NOT KAHANERRHAO_FOUND)
  MESSAGE ("-- In order to find kahanerrhao, please define LIBHAO='/path/to/libhao' ")
endif()
