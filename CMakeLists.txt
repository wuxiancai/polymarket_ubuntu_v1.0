# 原有代码...

# 添加Linux特定配置
if(UNIX AND NOT APPLE)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(GTK4 REQUIRED gtk4)
    
    include_directories(${GTK4_INCLUDE_DIRS})
    link_directories(${GTK4_LIBRARY_DIRS})
    add_definitions(${GTK4_CFLAGS_OTHER})
    
    target_link_libraries(${PROJECT_NAME} 
        ${GTK4_LIBRARIES}
    )
endif()

# 其余代码... 