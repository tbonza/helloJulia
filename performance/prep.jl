using ArgParse
using CSV
using DataFrames
using JSON

function parse_commandline()
    s = ArgParseSettings(   )
    @add_arg_table s begin
        "input"
            help = "input file path"
            required = true
        "output"
            help = "output file path"
            required = true
        "--n"
            help = "number of lines to read"
            arg_type = Int
            default = 0
        "--mock"
            help = "number of regular expressions to mock"
            arg_type = Int
            default = 0
    end

    return parse_args(s)
end

struct YelpReview
    review_id::String
    date::String
    text::String
end

"""
    handlef(input, output, n)

Yelp Review dataset has a pretty unique format.
This function selects a subset of pre-determined 
attributes and outputs a CSV file for the performance
demo as it relates to regular expression matching.
"""
function handlef(input, output, n)

    

    arr = Array{YelpReview,1}()

    open(input,"r") do f
        for line in eachline(f)
            if n == 0
                break
            end
            d = JSON.parse(line)

            yr = YelpReview(get(d, "review_id", ""),
                            get(d, "date", ""),
                            lowercase(replace(get(d, "text", ""), "\n" => " ")))
            push!(arr, yr)
            n -= 1
        end
    end
    return arr
end

"""
    mockregex(basewords::Array{String,1}, n::Int)::Array{Regex,1}

Generate n mock regular expressions to run against Yelp Review text
field.
"""
mockregex(basewords::Array{String,1}, n::Int)::Array{String,1} = [rand(basewords) for i in 1:n]


###################################
# Run Script
###################################

innodb_stopwords = ["a", "about", "an", "are", "as", 
                    "at", "be", "by", "com", "de", "en",
                    "for", "from", "how", "i", "in", "is",
                    "it", "la", "of", "on", "or", "that",
                    "the", "this", "to", "was", "what", 
                    "when", "where", "who", "will", "with",
                    "und", "the", "www"]

parsed_args = parse_commandline()

input = string(get(parsed_args, "input", nothing))
output = string(get(parsed_args, "output", nothing))
n = get(parsed_args, "n", 0)
mockn = get(parsed_args, "mock", 0)

csv_output = string(output, ".txt")
reg_output = string(output, ".regex")

df = DataFrame(handlef(input, output, n))
regs = mockregex(innodb_stopwords, mockn)

open(csv_output, "w") do f
    for inst in df[:,:text]
        write(f, string(inst, "\n"))
    end
end

open(reg_output, "w") do f
    for inst in regs
        write(f, string(inst, "\n"))
    end
end
