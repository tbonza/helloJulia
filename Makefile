CC = g++
CFLAGS = -g -Wall -std=c++11

all: RegexBenchmark

clean:
	rm RegexBenchmark

RegexBenchmark: regex_benchmark.cc
	$(CC) $(CFLAGS) regex_benchmark.cc -o RegexBenchmark
