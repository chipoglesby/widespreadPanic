#!/bin/bash

#Variables
apiKey="xxx"
artist="3797a6d0-7700-44bf-96fb-f44386bc9ab2/setlists"
total=$(curl -X GET --header 'Accept: application/json' --header x-api-key:"$apiKey" "https://api.setlist.fm/rest/1.0/artist/$artist?p=1" | jq -c '.total')
per_page=20
count=$((total / per_page + 1))

for page in $(seq 1 "$count"); do
 echo "On page: $page"
 curl -X GET --header 'Accept: application/json' --header x-api-key:"$apiKey" "https://api.setlist.fm/rest/1.0/artist/$artist?p=$page" | jq -c '.setlist[]' >> setlist2.json
done
