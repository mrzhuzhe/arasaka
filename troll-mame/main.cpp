#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>

int main(){

    printf("list file in folder \n");

    std::string path = "../../games/mame/uncate-roms/";
    std::string listpath = "./outputs/mame_list.xml";
    std::fstream file;
    std::vector<std::string> content;
    content.reserve(6638278);
    file.open(listpath, std::ios::in);
    if (file.is_open()) {
        std::string line;
        while (std::getline(file, line)) {
            content.push_back(line);
        }
        file.close();
    }
    size_t content_size = content.size();
    std::cout << "content size " << content_size << std::endl;
    std::cout << "content peak " << content[100] << std::endl;

    for (const std::filesystem::directory_entry& entry : std::filesystem::directory_iterator(path)) {
        std::string tmp_filename = entry.path().filename();
        tmp_filename = tmp_filename.replace(tmp_filename.find(".zip"), 4 ,"");
        //std::cout << tmp_filename << std::endl;
        for (int i =0;i<content_size;i++){
            std::size_t found = content[i].find("name=\""+tmp_filename+"\"");
            if (found!=std::string::npos){
                std::cout << content[i] << std::endl;
                std::cout << content[i+1] << std::endl;
                std::cout << content[i+2] << std::endl;
                std::cout << "" << std::endl;
                break;
            }        
            //std::cout << content[i].find(entry.path().filename()) << std::endl;            
        }        
        //break;
    }
    

}