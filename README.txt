SmallptCPU vs. SmallptGPU
=========================

SmallptGPU is a small and simple demo written in OpenCL in order to test the
performance of this new standard. It is based on Kevin Beason's Smallpt available
at http://www.kevinbeason.com/smallpt/
SmallptGPU has been written using the ATI OpenCL SDK 2.0 on Linux but it
should work on any platform/implementation.

glut32.dll has been downloaded from Nate Robins's http://www.xmission.com/~nate/glut.html


How to compile
==============

Requires Visual Studio 2008

Install the "NVIDIA GPU Computing SDK" to its standard location. (If you install it 
somewhere else, edit the linker and include dirs in the project file)

To compile the GPU version, add the smallptCPU.c file to the project, and remove the 
GPU version.


Key bindings
============

'p' - save image.ppm
ESC - exit
Arrow keys - rotate camera left/right/up/down
'a' and 'd' - move camera left and right
'w' and 's' - move camera forward and backward
'r' and 'f' - move camera up and down
PageUp and PageDown - move camera target up and down
' ' - refresh the window
'l' - enable/disable indirect diffuse path (available only
on CPU version because a bug of ATI's compiler)
'+' and '-' - to select next/previous object
'2', '3', '4', '5', '6', '8', '9' - to move selected object

History
=======

V1.5 - Thanks to discussion at http://forum.beyond3d.com/showthread.php?t=55913
the perfomances on NVIDA GPUs have been improved. They are not yet where they should
be but are lot better now.

V1.4 - Updated for ATI SDK 2.0, fixed a problem in object selection

V1.3 - Jens's patch for MacOS, added on-screen help, fixed performance
estimation, removed movie recording, added on-screen help, added Windows binaries

V1.2 - Indirect diffuse path can be now disabled/enabled (available only
on CPU version because a bug of ATI's compiler), optimized buffers
reallocation, added keys to select/move objects

V1.1 - Fixed few portability problems, added support to save movie, fixed a
problem in window resize code

V1.0 - First release
