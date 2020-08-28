# Hello, Julia!

This repo corresponds to a Julia talk I gave at the Gartner Data Science User Group. Please note that
this code has only been run on Mac OSx. Your mileage may vary on Windows.

```
git clone --recurse-submodules https://github.com/tbonza/helloJulia.git
```

The Umbrella package can be accessed directly here: [https://github.com/tbonza/Umbrella](https://github.com/tbonza/Umbrella)

## Data Collection and Preprocessing

Download and unzip the [Kaggle: Yelp Reviews Academic Dataset](https://www.kaggle.com/yelp-dataset/yelp-dataset/data?select=yelp_academic_dataset_review.json).
Run the preparation script to configure data for the Yelp Reviews regular expression matching benchmark.

```
julia prep.jl "yelp_academic_dataset_review.json" \
    "yelp_example" --n 1000000 --mock 1000
```

## Regex Benchmark

Note that you'll need to add the Julia package [Umbrella](https://github.com/tbonza/Umbrella)
to run the benchmark. Also note that the R benchmark may not finish depending the size.

* C++: `make && time ./RegexBenchmark`
* Julia: `time julia regex_benchmark.jl`
* Python: `time python3 regex_benchmark.py`
* R: `time Rscript regex_benchmark.R` 

## Parallel Regex Benchmark

Currently, the Julia threads benchmark is running fastest on my laptop. Precompiling
really helps!

* Julia distributed: `julia -p 6 regex_distributed_benchmark.jl`
* Julia threads: `julia --threads 6 regex_threads_benchmark.jl`
* Python multiprocessing: `python3 regex_distributed_benchmark.py`
