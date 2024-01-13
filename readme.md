# BLAS Bindings for Odin

The `blas.odin` file contains a complete, but untested set of BLAS bindings to `version 3.12.0.2` of LAPACK. I was not able to get lapack to bind correctly due to fortran runtime, ucrt amongst other linking issues, I'm sure someone with more makefile experience could craft up a solution. I have included the .a files for blas compiled on Win10 x64. You can compile them yourself per the instructions below.

## Compiling lapack from Source

get msys2: https://github.com/msys2/msys2-installer/releases/download/2024-01-13/msys2-x86_64-20240113.exe
get lapack: https://www.netlib.org/lapack/#_lapack_version_3_12_0_2

```shell
pacman -Syu                                     (Update Repos)
pacman -Ss gcc-fortran                          (Search for fortrans)
pacman -S mingw-w64-ucrt-x86_64-gcc-fortran     (install fortran)
pacman -S make gcc python                       (other needed build deps)
```

navigate to lapack folder and build:

```shell
cd /c/dev/_external/lapack      (my install location)
cp make.inc.example make.inc    (need to take off the example bit)
(OPTIONAL): in make.inc uncomment line 63: LAPACKE_WITH_TMG = Yes
make                            (this is gonna take a while)
cd lapacke
make                            (build c-wrappers)

cd ..
cd cblas
make                            (build cblas)
```

the end-state should produce at the top-level directory:
libcblas.a C-ABI
liblapack.a Fortran-ABI
liblapacke.a C-ABI
librefblas.a Fortran-ABI
libtmglib.a Fortran-ABI
