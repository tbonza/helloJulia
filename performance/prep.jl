using ArgParse
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
    end

    return parse_args(s)
end

function handlef(input, output, n)

    open(input,"r") do f
        for line in eachline(f)
            if n == 0
                break
            end
            println("n ", n)
            n -= 1
        end
    end
end

parsed_args = parse_commandline()

input = string(get(parsed_args, "input", nothing))
output = string(get(parsed_args, "output", nothing))
n = get(parsed_args, "n", 0)

handlef(input, output, n)
