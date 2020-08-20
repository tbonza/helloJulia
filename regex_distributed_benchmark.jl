using Umbrella

regexes = [Regex(i) for i in readlines("yelp_example.regex")]
text = readlines("yelp_example.txt")
batch_size = 1000

dist_example2(text, regexes, batch_size)
