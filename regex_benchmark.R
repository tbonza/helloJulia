library(readr)
library(stringr)

regexes = read_lines("yelp_example.regex")
text = read_lines("yelp_example.txt")

for (regex in regexes) {
    found = str_detect(text, regex)
}
