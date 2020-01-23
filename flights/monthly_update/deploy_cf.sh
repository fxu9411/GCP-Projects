#!/bin/bash

URL=ingest_flights
echo $URL

gcloud functions deploy $URL --runtime python37 --trigger-http --timeout 480s
