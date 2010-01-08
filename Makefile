#
# smallptGPU & smallptCPU Makefile
#

ATISTREAMSDKROOT=F:/ProgramData/NVIDIA Corporation/NVIDIA GPU Computing SDK/OpenCL/common

CC=gcc
CCFLAGS=-O3 -msse2 -mfpmath=sse -ftree-vectorize -funroll-loops -Wall \
	-I"$(ATISTREAMSDKROOT)/inc/CL" -L"$(ATISTREAMSDKROOT)/lib/Win32" -L"P:/freeglut/lib" -lfreeglut -lOpenCL
# Jens's patch for MacOS, comment the 2 lines above and un-comment the lines below
#CCFLAGS=-O3 -ftree-vectorize -msse -msse2 -msse3 -mssse3 -fvariable-expansion-in-unroller \
#	-cl-fast-relaxed-math -cl-mad-enable -Wall -framework OpenCL -framework OpenGl -framework Glut

default: all

all: Makefile smallptCPU smallptGPU preprocessed_kernels

smallptCPU: smallptCPU.c displayfunc.c Makefile vec.h camera.h geom.h displayfunc.h simplernd.h scene.h geomfunc.h
	$(CC) $(CCFLAGS) -DSMALLPT_CPU -o smallptCPU smallptCPU.c displayfunc.c

smallptGPU: smallptGPU.c displayfunc.c Makefile vec.h camera.h geom.h displayfunc.h simplernd.h scene.h geomfunc.h
	$(CC) $(CCFLAGS) -DSMALLPT_GPU -o smallptGPU smallptGPU.c displayfunc.c

clean:
	rm -rf smallptCPU smallptGPU image.ppm SmallptGPU-v1.6alpha smallptgpu-v1.6alpha.tgz preprocessed_rendering_kernel.cl

preprocessed_kernels:
	cpp <rendering_kernel.cl >preprocessed_rendering_kernel.cl

tgz: clean all
	mkdir SmallptGPU-v1.6alpha
	cp -r smallptCPU smallptGPU scenes camera.h displayfunc.c displayfunc.h geomfunc.h geom.h \
		LICENSE.txt Makefile README.txt scene.h simplernd.h smallptCPU.c smallptGPU.c \
		vec.h rendering_kernel.cl preprocessed_rendering_kernel.cl \
		*.bat \
		SmallptGPU.exe glut32.dll SmallptGPU-v1.6alpha
	tar zcvf smallptgpu-v1.6alpha.tgz SmallptGPU-v1.6alpha
	rm -rf SmallptGPU-v1.6alpha


gcc -O3 -msse2 -mfpmath=sse -funroll-loops -Wall -I"F:/ProgramData/NVIDIA Corporation/NVIDIA GPU Computing SDK/OpenCL/common/inc/CL" -L"F:/ProgramData/NVIDIA Corporation/NVIDIA GPU Computing SDK/OpenCL/common/lib/Win32" -lglut -lOpenCL -DSMALLPT_CPU -o smallptCPU smallptCPU.c displayfunc.c