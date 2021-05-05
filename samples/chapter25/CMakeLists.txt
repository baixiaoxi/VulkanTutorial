add_executable(chapter25 src/25_texture_mapping.cpp)
target_include_directories(chapter25 PRIVATE ${GLM_INCLUDE_DIRS} ${STB_INCLUDE_DIRS})
target_link_libraries(chapter25 glfw ${Vulkan_LIBRARY})

set(RESOURCE_FILES
    shaders/frag.spv
    shaders/vert.spv
    textures/texture.jpg
)

foreach(resource_file ${RESOURCE_FILES})
    add_custom_command(
        TARGET chapter25 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_SOURCE_DIR}/${resource_file}
                $(OutDir)/${resource_file}
    )
endforeach(resource_file)