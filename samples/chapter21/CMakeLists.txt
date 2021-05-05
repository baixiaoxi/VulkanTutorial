add_executable(chapter21 src/21_descriptor_layout.cpp)
target_include_directories(chapter21 PRIVATE ${GLM_INCLUDE_DIRS})
target_link_libraries(chapter21 glfw ${Vulkan_LIBRARY})

set(RESOURCE_FILES
    shaders/frag.spv
    shaders/vert.spv
)

foreach(resource_file ${RESOURCE_FILES})
    add_custom_command(
        TARGET chapter21 POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_CURRENT_SOURCE_DIR}/${resource_file}
                $(OutDir)/${resource_file}
    )
endforeach(resource_file)