# Frequently Asked Questions

## My model uses meterology inputs.  Where can I find forecasts of weather to use in my ecological forecast?

We have downloaded and temporally downscaled (6 hr to 1 hr) weather forecasts from NOAA's Global Ensemble Forecasting System (GEFS). GEFS produces 31 different forecasts (called an ensemble with 31 members) at four cycles a day (00:00, 06:00, 12:00, and 18:00 UTC), where these are the times that the forecast starts.  The forecast that starts at the 00:00 cycle runs 30 of the 31 ensemble members 35-days in the future.  All other forecast cycles have members that run 16-days in the future.  

The forecasts can be found at https://data.ecoforecast.org/minio/drivers/noaa/NOAAGEFS_1hr/

The following variables are available: air temperature, wind speed, relative humidity, downwelling shortwave, downwelling longwave, precipitation, and air pressure.  

## I need historical weather data to build my model.  Where can I find it.

NEON collects weather variables at each of the sites. Their data products become available in 1-month data packages that are release ~ 2 weeks after the completion of the month.  For example, the June 1 data will be in the June package that is released mid-July.  Therefore there is up to a 1.5 month delay.  Furthermore, NEON data can have gaps that need to be gap-filled.  We are working with NEON to develop gap-filled weather data that becomes available sooner than the current 1.5 month delay.  The timing of the gap-filled low-latency weather product is unknown.  

1) If you don't need real-time data, NEON weather data products are available on the NEON data portal at the following data products:

- Air temperature: https://data.neonscience.org/data-products/DP1.00002.001

- Precipitation: https://data.neonscience.org/data-products/DP1.00006.001

- Radiation: https://data.neonscience.org/data-products/DP1.00023.001

- Wind: https://data.neonscience.org/data-products/DP1.00001.001

- Relative humidity: https://data.neonscience.org/data-products/DP1.00098.001

- Air pressure: https://data.neonscience.org/data-products/DP1.00004.001

- Summary statistics (daily, monthly, annually): https://data.neonscience.org/data-products/DP4.00001.001

2) Gridded weather from models that have been assimilated with observations is available from other sources including:

- [NASAs National Land Data Assimilation System](https://ldas.gsfc.nasa.gov/nldas/v2/forcing):  4 day delay


## My submitted  by forecast but can not find it on the dashboard or in the directory of forecasts

A successful submission can be found at the following links within 2 hours of submissions

Aquatics: https://data.ecoforecast.org/minio/forecasts/aquatics

Terrestrial: https://data.ecoforecast.org/minio/forecasts/terrestrial
 
Beetles: https://data.ecoforecast.org/minio/forecasts/beetles

Ticks: https://data.ecoforecast.org/minio/forecasts/ticks

Phenology: https://data.ecoforecast.org/minio/forecasts/phenology

We run a validator script when processing the submissions. If your submission does not meet the file standards above, it will be moved to a separate location and a log file (same name as submitted file with "log" appended to end) will be generated with some hints about why it did not meet the standard.  If your submission did not meet the standard contact us and we can help you work through the issues.

https://data.ecoforecast.org/minio/forecasts/not_in_standard

## Do I need to submit forecasts to every submission date?

No, we are excited to have submissions at any of the submissions dates.

## Where can I find examples of forecasts that match the required standard?

Aquatics

https://data.ecoforecast.org/forecasts/aquatics/aquatics-2021-03-01-EFInull.csv.gz

Phenology

https://data.ecoforecast.org/forecasts/phenology/phenology-2021-02-23-UCSC_P_EDM.csv

https://data.ecoforecast.org/forecasts/phenology/phenology-2021-02-23-EFInull.nc

Beetles

https://data.ecoforecast.org/forecasts/beetles/beetles-2020-EFI_avg_null.csv.gz

Terrestrial

https://data.ecoforecast.org/forecasts/terrestrial/terrestrial_daily-2020-10-01-EFInulldaily.csv.gz

https://data.ecoforecast.org/forecasts/terrestrial/terrestrial_30min-2021-04-01-hist30min.nc

Ticks

https://data.ecoforecast.org/forecasts/ticks/ticks-2019-03-04-tickGlobalNull_RandomWalk.csv.gz

## I am having trouble generating the metadata.  Can you point me to more information, tutorials, or examples?

Pending

## How many years are you planning to run the Challenge?

The RCN is a 5-year project and we aim to run the Challenge for the duration of the project.  Each year will be a new round where we revise the rules (if necessary) and add new Themes.  Your feedback on the Challenge will be critical to revising and clarifying the rules and information about the Challenge.

## Are there certain types of models that I need to use

No, you can use any type of model, including empirical and process-based models.  The only requirement is that your forecast includes uncertainty.  The uncertainty can be represents using different model runs (ensemble members) or the statistics of the forecast (mean and standard deviation).

## What is the relationship with NEON?

The Challenge is run by the Ecological Forecasting Initiative Research Coordination Network that is funded by the U.S. National Science Foundation.  While this effort is separate from NEON, NEON staff have been in involved in all stages of planning.  NEON staff are on the project steering committee and theme design teams. 

Members of the RCN are also on NEON's Ecological Forecasting Technical Working Group. This is formal pathway to provide feedback to NEON.



