#Try to find ghf_hubbard_fftw
set(ghf_hubbard_fftw_path "$ENV{GHF_HUBBARD_FFTW}")
find_library(ghf_hubbard_fftw_libraries NAMES libghf_hubbard_fftw_hao.a PATHS "${ghf_hubbard_fftw_path}/lib")
find_path(ghf_hubbard_fftw_include_dirs afqmc_define.h PATHS "${ghf_hubbard_fftw_path}/include")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ghf_hubbard_fftw  DEFAULT_MSG
                                  ghf_hubbard_fftw_libraries ghf_hubbard_fftw_include_dirs)
mark_as_advanced(ghf_hubbard_fftw_include_dirs ghf_hubbard_fftw_libraries)

if(NOT GHF_HUBBARD_FFTW_FOUND)
  MESSAGE ("-- In order to find ghf_hubbard_fftw, please define GHF_HUBBARD_FFTW='/path/to/ghf_hubbard_fftw' ")
endif()
