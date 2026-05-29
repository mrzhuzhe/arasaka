#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>
#include <regex>

int main(){

    printf("list file in folder \n");

    std::string path = "../../games/mame/uncate-roms/"; 
    std::string listpath = "./outputs/result.txt";
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

    std::regex pattern("name=\"([^\"]+)\""); // Matches exactly 3 digits
    std::smatch match;

    size_t count = 0;
    for (int i =0;i<content_size;i=i+4){
        //std::cout << content[i] << std::endl;;
        size_t found = content[i+2].find("<year>1998");
        //size_t found = content[i+1].find("Mahjong");
        //size_t found = content[i+1].find("Poker");
        if (found!=std::string::npos){
            //std::cout << content[i] << std::endl;
            if (std::regex_search(content[i], match, pattern)) {
                std::cout << "Found: " << match[1].str() << std::endl;
                // handle this file
                std::remove(std::string(path + match[1].str() + ".zip").c_str());
            }
            std::cout << content[i+1] << std::endl;
            std::cout << content[i+2] << std::endl;
            std::cout << "" << std::endl;
            count ++;
        }                         
    }    
    std::cout << count << std::endl;    
}