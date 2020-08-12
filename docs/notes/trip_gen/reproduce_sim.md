#### Locations that make a random draw 

 * get_tripEVs_from_sourceEVs - This function finds n EVs that make the trip from a particular zipcode from N (N > n) EVs that exist in that zipcode. Uses the function `sample_n()` without replacement. `set.seed()` should work, as exemplified here: https://community.rstudio.com/t/sample-not-respecting-set-seed-r-3-5-2/32131/5. Do need to re-run `set.seed()` everytime sample_n is run. 

* trip_gen - Sampling is done to get the starting SOC for EVs in the upper and lower limit. `set.seed()` should work. 

* create_return_df - Seed is set in two places, for `stats::rpois` and `stats::rbinom`, using `set.seed(config[['GLOBAL_SEED']])`. 

* Used `set.seed()` in `rnd_date_time()` which uses `stats::runif()` to generate a random date time.

* Used `set.seed()` in `trip_gen()` at the end where it uses `stats::rbinom()`. 

* Result looks reproducible for time, OD, overall trip count, more verification pending. 

#### Re-factor the code so that charging distances are calculated as needed

Should be doable as charging distance is needed once at the end of the trip generation process. Same applies for destination chargers. Create functions that calculate the charging distance for an OD pair, given chademo or combo. 
