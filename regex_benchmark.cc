#include <fstream>
#include <iostream>
#include <regex>
#include <string>


int main(){

    std::string pat;
    std::vector<std::regex> patterns;

    std::ifstream regexes ("yelp_example.regex");
    if (regexes.is_open()){
        while (! regexes.eof() ) {
            std::getline(regexes, pat);
            patterns.push_back(std::regex(pat));
        }
        regexes.close();
    }

    std::string line;
    std::ifstream yelptext ("yelp_example.txt");
    int count = 0;
    if (yelptext.is_open()){
        while (! yelptext.eof() ) {
            std::getline(yelptext, line);

            for (int i=0; i < patterns.size(); i++){
                if (std::regex_match(line, patterns.at(i))){
                }
            }

            if (count % 10000 == 0){
                std::cout << "Processed lines. " << count << std::endl;
            }
            count += 1;
        }
        yelptext.close();
    }
    return 0;
}
