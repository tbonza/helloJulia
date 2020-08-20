
regexes = [Regex(i) for i in readlines("yelp_example.regex")]
text = readlines("yelp_example.txt")

for t in text
    for r in regexes
        if occursin(r,t)
        end
    end
end
