using Umbrella

regexes = [Regex(i) for i in readlines("yelp_example.regex")]
text = readlines("yelp_example.txt")

example3(text, regexes)

