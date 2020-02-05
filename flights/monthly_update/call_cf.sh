#!/bin/bash

curl -H "Content-type: application/json" -d '{"bucket":"data_science_on_gcp_bucket", "token":"bWJ3745beyuGhZN8mKn8z8laqlndh8c6"}' 'https://us-central1-valid-amplifier-265717.cloudfunctions.net/ingest_flights'