add_executable(chapter13 src/13_framebuffers.cpp)
target_link_libraries(chapter13 glfw ${Vulkan_LIBRARY})

set(RESOURCE_FILES
    shaders/frag.spv
    shaders/vert.spv
)

foreach(resource_file ${RESOURCE_FILES})
    add_custom_command(
        TARGET chapter13 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_SOURCE_DIR}/${resource_file}
                $(OutDir)/${resource_file}
    )
endforeach(resource_file)