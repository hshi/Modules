#Try to find mkl
set(mkl_path "$ENV{MKL}")
find_library(lp64_libraries NAMES mkl_intel_lp64 PATHS "${mkl_path}/lib/intel64")
find_library(core_libraries NAMES mkl_core PATHS "${mkl_path}/lib/intel64")
find_library(gnu_thread_libraries NAMES mkl_gnu_thread PATHS "${mkl_path}/lib/intel64")
set(mkl_libraries ${lp64_libraries} ${core_libraries} ${gnu_thread_libraries})

find_path(mkl_include_dirs mkl.h PATHS "${mkl_path}/include")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(mkl  DEFAULT_MSG
                                  mkl_libraries mkl_include_dirs)
mark_as_advanced(mkl_include_dirs mkl_libraries)
set(mkl_flags "-fopenmp -m64")

if(NOT MKL_FOUND)
  MESSAGE ("-- In order to find mkl, please define MKL='/path/to/mkl' ")
endif()
