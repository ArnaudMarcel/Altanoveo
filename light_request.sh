#!/bin/bash
echo "--------START PROCESSING AT: $(date "+%Y-%m-%d %H:%M:%S")--------"

query='cook'
fields='created_at,public_metrics,author_id,lang'
bearerToken='1490688234296381440-VT69KI8vI6uB4heacyOiidLFdSWGrv'
maxresults=100
echo "===> couting output"
curl -X GET -H "Authorization: Bearer ${bearerToken}" "https://api.twitter.com/2/tweets/counts/recent?query=${query}" > count_tweet.json
echo "===> start request"
curl -X GET -H "Authorization: Bearer ${bearerToken}" "https://api.twitter.com/2/tweets/search/recent?tweet.fields=${fields}&max_results=${maxresults}&query=${query}" > output_tweet.json

echo "--------START FINISHED AT: $(date "+%Y-%m-%d %H:%M:%S")--------"
