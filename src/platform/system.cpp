#ifdef __APPLE__
    // macOS specific code...
#elif defined(__linux__)
    #include <gtk/gtk.h>
    
    void initialize_platform() {
        gtk_init();
        // Linux平台初始化
    }
    
    std::string get_config_path() {
        return std::string(g_get_user_config_dir()) + "/appname";
    }
    
    void show_window(void* window_handle) {
        GtkWindow* window = GTK_WINDOW(window_handle);
        gtk_window_present(window);
    }
#endif

// 其余代码... 