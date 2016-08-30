#For library
set(lib_all "")

#For GMP library
find_package(gmp REQUIRED)
set(lib_all ${gmp_libraries} ${lib_all})

#For sprng
find_package(sprng REQUIRED)
add_definitions(${sprng_definitions})
include_directories(${sprng_include_dirs})
set(lib_all ${sprng_libraries} ${lib_all})

#Find fftw libary
find_package(fftw REQUIRED)
include_directories(${fftw_include_dirs})
set(lib_all ${fftw_libraries} ${lib_all})

# For lapackblas library
find_package(mkl)
find_package(acml)
find_package(LAPACK)
if(MKL_FOUND)
  message("-- Use MKL library." )
  add_definitions(-DUSE_MKL)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${mkl_flags}")
  include_directories(${mkl_include_dirs})
  set(lapackblas_libraries "${mkl_libraries}")
elseif(ACML_FOUND)
  message("-- Use ACML library." )
  add_definitions(-DUSE_ACML)
  include_directories(${acml_include_dirs})
  set(lapackblas_libraries "${acml_libraries}")
elseif(LAPACK_FOUND AND BLAS_FOUND)
  message("-- Use system lapack and blas library." )
  #Usually, Fortran has underscore
  #No need to turn on FORTRAN_NO_UNDERSCORE
  if(FORTRAN_NO_UNDERSCORE)
    add_definitions(-DFORTRAN_NO_UNDERSCORE)
  endif()
  add_definitions(-DUSE_BLAS_LAPACK)
  set(lapackblas_libraries ${LAPACK_LIBRARIES})
else()
  message( FATAL_ERROR "Find no library for blas and lapack!" )
endif()
set(lib_all ${lapackblas_libraries} ${lib_all})

#For magma library
if(USE_MAGMA)
  message("-- Use MAGMA library." )
  add_definitions(-DUSE_MAGMA)
  # Use standard FindCUD
  find_package(CUDA REQUIRED)
  include_directories(${CUDA_INCLUDE_DIRS})
  find_package(magma REQUIRED)
  include_directories(${magma_include_dirs})
  set(gpu_libraries "${magma_libraries}" ${CUDA_LIBRARIES} ${CUDA_CUBLAS_LIBRARIES})
else()
  MESSAGE("-- MAGMA support was disabled.")
endif()
set(lib_all ${gpu_libraries} ${lib_all})

#For libaray hao
find_package(libhao REQUIRED)
include_directories(${libhao_include_dirs})
set(lib_all ${libhao_libraries} ${lib_all})
