import logging
from flask import escape
from .ingest_flights import *

def ingest_flights(request):
    try:
        logging.basicConfig(format='%(levelname)s: %(message)s', level=logging.INFO)
        json = request.get_json()

        if escape(json['token']) != 'QHh3ST4mv6nIfFZaLyXZbeXtGQqkU9Im':
            logging.info('Ignoring request without valid token')
            return

        year = escape(json['year']) if 'year' in json else None
        month = escape(json['month']) if 'month' in json else None
        bucket = escape(json['bucket'])

        if year is None or month is None or len(year) == 0 or len(month) == 0:
            year, month = ingest_flights.next_month(bucket)
        logging.debug('Ingesting year = {}, month = {}'.format(year, month))
        gcs_file = ingest_flights.ingest(year, month, bucket)
        logging.info('Success ... ingested to {}'.format(gcs_file))

    except ingest_flights.DataUnavailable as e:
        logging.info('Try again later: {}'.format(e.message))