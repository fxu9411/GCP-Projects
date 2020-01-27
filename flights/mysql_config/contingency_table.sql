select count(dest) from bts.flights where
arr_delay < ARR_DELAY_THRESH and dep_delay < DEP_DELAY_THRESH;
