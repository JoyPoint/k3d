INCLUDE_DIRECTORIES(${K3D_FTGL_INCLUDE_DIR})
INCLUDE_DIRECTORIES(${K3D_FREETYPE2_INCLUDE_DIRS})
LINK_DIRECTORIES(${K3D_FREETYPE2_LIB_DIRS})

K3D_BUILD_MODULE(k3d-reference-opengl-painters)
K3D_CREATE_MODULE_PROXY(k3d-reference-opengl-painters)

TARGET_LINK_LIBRARIES(k3d-reference-opengl-painters ${K3D_FTGL_LIBRARY})
TARGET_LINK_LIBRARIES(k3d-reference-opengl-painters ${K3D_FREETYPE2_LIBS})

