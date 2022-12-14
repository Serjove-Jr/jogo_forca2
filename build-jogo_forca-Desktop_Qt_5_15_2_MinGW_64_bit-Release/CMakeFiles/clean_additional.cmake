# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles\\jogo_forca_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\jogo_forca_autogen.dir\\ParseCache.txt"
  "jogo_forca_autogen"
  )
endif()
