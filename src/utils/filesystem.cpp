#include <filesystem>
namespace fs = std::filesystem;

// 使用跨平台的std::filesystem替代平台特定API
std::string get_documents_path() {
    #ifdef __APPLE__
        // macOS specific code...
    #elif defined(__linux__)
        const char* home = getenv("HOME");
        return std::string(home) + "/Documents";
    #endif
}

// 其余代码... 