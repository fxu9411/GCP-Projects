select count(dest) from flights where
arr_delay < ARR_DELAY_THRESH and dep_delay < DEP_DELAY_THRESH;
