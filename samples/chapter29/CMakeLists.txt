add_executable(chapter29 src/29_multisampling.cpp)
target_include_directories(chapter29 PRIVATE ${GLM_INCLUDE_DIRS} ${STB_INCLUDE_DIRS} ${TINY_OBJ_LOADER_INCLUDE_DIRS})
target_link_libraries(chapter29 glfw ${Vulkan_LIBRARY})

set(RESOURCE_FILES
    shaders/frag.spv
    shaders/vert.spv
    textures/viking_room.png
    models/viking_room.obj
)

foreach(resource_file ${RESOURCE_FILES})
    add_custom_command(
        TARGET chapter29 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_SOURCE_DIR}/${resource_file}
                $(OutDir)/${resource_file}
    )
endforeach(resource_file)