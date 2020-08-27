import re
import multiprocessing as mp 
from functools import partial


def regex_search(regexes, t):
    for r in regexes:
        if r.match(t):
            pass

if __name__ == "__main__":

    # limit to 6 processors
    pool = mp.Pool(processes=6)

    # precompile the regexes
    regexes = [re.compile(i) for i in open("yelp_example.regex","r").readlines()]

    # read the test lines
    text = open("yelp_example.txt","r").readlines()

    # Create partial function with the pre-compiled regexes to provide to the workers
    search = partial(regex_search, regexes)

    # map the regex search over the 6 processors
    pool.map(search, text)

# real    0m40.755s
# user    3m50.443s
# sys     0m2.631s