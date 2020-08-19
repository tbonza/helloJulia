import re



if __name__ == "__main__":

    regexes = [re.compile(i) for i in open("yelp_example.regex","r").readlines()]
    text = open("yelp_example.txt","r").readlines()

    for t in text:
        for r in regexes:
            if r.match(t):
                pass
