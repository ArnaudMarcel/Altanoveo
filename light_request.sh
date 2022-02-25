#!/bin/bash
echo "--------START PROCESSING AT: $(date "+%Y-%m-%d %H:%M:%S")--------"

query='wheelbarrow'
fields='created_at,public_metrics,author_id,lang'
bearerToken='AAAAAAAAAAAAAAAAAAAAAINlZgEAAAAAWkessX16ldt0dpRmEvI3HSS0RV0%3DXotNmRMj5yL8Cw7fRWIEvblyH7bRV3OsmuXO4Ir6vwaiThCl2Y'
maxresults=100
echo "===> couting output"
curl -X GET -H "Authorization: Bearer ${bearerToken}" "https://api.twitter.com/2/tweets/counts/recent?query=${query}"
echo "===> start request"
curl -X GET -H "Authorization: Bearer ${bearerToken}" "https://api.twitter.com/2/tweets/search/recent?tweet.fields=${fields}&max_results=${maxresults}&query=${query}" > without_fire/output_${query}_tweet.json

echo "--------START FINISHED AT: $(date "+%Y-%m-%d %H:%M:%S")--------"
