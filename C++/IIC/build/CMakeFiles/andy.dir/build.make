# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /samba-ubuntu/cmake-3.11.0-rc2-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /samba-ubuntu/cmake-3.11.0-rc2-Linux-x86_64/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /samba-ubuntu/bonaventureli-ssh/C++/IIC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /samba-ubuntu/bonaventureli-ssh/C++/IIC/build

# Include any dependencies generated for this target.
include CMakeFiles/andy.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/andy.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/andy.dir/flags.make

CMakeFiles/andy.dir/I2C_Device.cpp.o: CMakeFiles/andy.dir/flags.make
CMakeFiles/andy.dir/I2C_Device.cpp.o: ../I2C_Device.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/andy.dir/I2C_Device.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/andy.dir/I2C_Device.cpp.o -c /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Device.cpp

CMakeFiles/andy.dir/I2C_Device.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/andy.dir/I2C_Device.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Device.cpp > CMakeFiles/andy.dir/I2C_Device.cpp.i

CMakeFiles/andy.dir/I2C_Device.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/andy.dir/I2C_Device.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Device.cpp -o CMakeFiles/andy.dir/I2C_Device.cpp.s

CMakeFiles/andy.dir/I2C_Resource.cpp.o: CMakeFiles/andy.dir/flags.make
CMakeFiles/andy.dir/I2C_Resource.cpp.o: ../I2C_Resource.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/andy.dir/I2C_Resource.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/andy.dir/I2C_Resource.cpp.o -c /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Resource.cpp

CMakeFiles/andy.dir/I2C_Resource.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/andy.dir/I2C_Resource.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Resource.cpp > CMakeFiles/andy.dir/I2C_Resource.cpp.i

CMakeFiles/andy.dir/I2C_Resource.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/andy.dir/I2C_Resource.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /samba-ubuntu/bonaventureli-ssh/C++/IIC/I2C_Resource.cpp -o CMakeFiles/andy.dir/I2C_Resource.cpp.s

CMakeFiles/andy.dir/HardwareFactory.cpp.o: CMakeFiles/andy.dir/flags.make
CMakeFiles/andy.dir/HardwareFactory.cpp.o: ../HardwareFactory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/andy.dir/HardwareFactory.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/andy.dir/HardwareFactory.cpp.o -c /samba-ubuntu/bonaventureli-ssh/C++/IIC/HardwareFactory.cpp

CMakeFiles/andy.dir/HardwareFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/andy.dir/HardwareFactory.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /samba-ubuntu/bonaventureli-ssh/C++/IIC/HardwareFactory.cpp > CMakeFiles/andy.dir/HardwareFactory.cpp.i

CMakeFiles/andy.dir/HardwareFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/andy.dir/HardwareFactory.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /samba-ubuntu/bonaventureli-ssh/C++/IIC/HardwareFactory.cpp -o CMakeFiles/andy.dir/HardwareFactory.cpp.s

CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o: CMakeFiles/andy.dir/flags.make
CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o: ../GPIO_Interrupt.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o -c /samba-ubuntu/bonaventureli-ssh/C++/IIC/GPIO_Interrupt.cpp

CMakeFiles/andy.dir/GPIO_Interrupt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/andy.dir/GPIO_Interrupt.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /samba-ubuntu/bonaventureli-ssh/C++/IIC/GPIO_Interrupt.cpp > CMakeFiles/andy.dir/GPIO_Interrupt.cpp.i

CMakeFiles/andy.dir/GPIO_Interrupt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/andy.dir/GPIO_Interrupt.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /samba-ubuntu/bonaventureli-ssh/C++/IIC/GPIO_Interrupt.cpp -o CMakeFiles/andy.dir/GPIO_Interrupt.cpp.s

# Object files for target andy
andy_OBJECTS = \
"CMakeFiles/andy.dir/I2C_Device.cpp.o" \
"CMakeFiles/andy.dir/I2C_Resource.cpp.o" \
"CMakeFiles/andy.dir/HardwareFactory.cpp.o" \
"CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o"

# External object files for target andy
andy_EXTERNAL_OBJECTS =

libandy.a: CMakeFiles/andy.dir/I2C_Device.cpp.o
libandy.a: CMakeFiles/andy.dir/I2C_Resource.cpp.o
libandy.a: CMakeFiles/andy.dir/HardwareFactory.cpp.o
libandy.a: CMakeFiles/andy.dir/GPIO_Interrupt.cpp.o
libandy.a: CMakeFiles/andy.dir/build.make
libandy.a: CMakeFiles/andy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libandy.a"
	$(CMAKE_COMMAND) -P CMakeFiles/andy.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/andy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/andy.dir/build: libandy.a

.PHONY : CMakeFiles/andy.dir/build

CMakeFiles/andy.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/andy.dir/cmake_clean.cmake
.PHONY : CMakeFiles/andy.dir/clean

CMakeFiles/andy.dir/depend:
	cd /samba-ubuntu/bonaventureli-ssh/C++/IIC/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /samba-ubuntu/bonaventureli-ssh/C++/IIC /samba-ubuntu/bonaventureli-ssh/C++/IIC /samba-ubuntu/bonaventureli-ssh/C++/IIC/build /samba-ubuntu/bonaventureli-ssh/C++/IIC/build /samba-ubuntu/bonaventureli-ssh/C++/IIC/build/CMakeFiles/andy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/andy.dir/depend

