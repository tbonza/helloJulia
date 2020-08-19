# Hello, Julia!

This repo corresponds to a Julia talk I gave at the Gartner Data Science User Group. Please note that
this code has only been run on Mac OSx. Your mileage may vary on Windows.

## Data Collection and Preprocessing

Download and unzip the [Kaggle: Yelp Reviews Academic Dataset](https://www.kaggle.com/yelp-dataset/yelp-dataset/data?select=yelp_academic_dataset_review.json).
Run the preparation script to configure data for the Yelp Reviews regular expression matching benchmark.

```
julia prep.jl "yelp_academic_dataset_review.json" \
    "yelp_example" --n 5000 --mock 1000
```


