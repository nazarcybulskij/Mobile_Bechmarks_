cmake_minimum_required(VERSION 3.4.1)  # for example

add_library( super_pi_flutter_native

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             ../ios/Classes/super_pi_flutter_native.cpp )
