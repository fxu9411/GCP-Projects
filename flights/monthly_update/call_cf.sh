#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: ./call_cf.sh  destination-bucket-name compute-region ingest-url  personal-access-token"
    echo "   eg: ./call_cf.sh  data_science_on_gcp_bucket us-central1 ingest_flights QHh3ST4mv6nIfFZaLyXZbeXtGQqkU9Im"
    exit
fi

PROJECT=$(gcloud config get-value project)
BUCKET=$1
REGION=$2
PATH=$3
TOKEN=$4

URL="https://${REGION}-${PROJECT}.cloudfunctions.net/${PATH}"

echo ${URL}

curl -X POST "https://${REGION}-${PROJECT}.cloudfunctions.net/${URL}" -H "Content-Type:application/json" --data-binary