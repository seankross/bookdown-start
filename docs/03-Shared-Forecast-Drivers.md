# Shared Forecast Drivers

We are downloading, subsetting, and processing forecasted meteorology drivers for each NEON site.  Currently, we have NOAA’s Global Ensemble Forecasting System V12 output available at the 1 hr time resolution for each NEON site.  For forecasts generated at midnight (00) UTC, the forecasts extend 35-days in the future.  For forecasts generated at 06, 12, and 18 UTC, the forecasts extend 16-days in the future.  There are 31 ensemble members for each forecast.  Each ensemble member is available as a separate netcdf file.  The following meteorological variables are included:  air temperature, air pressure, wind speed, precipitation, downwelling longwave radiation, downwelling shortwave radiation, relative humidity, specific humidity, and total cloud cover.  

The weather forecasts are available through an s3 bucket (see Meteorology: NOAA Global Ensemble Forecasting System below) with multiple ways to access them: You can click on a file in the browser, you can directly download individual files from the command line using the file address, or you can download multiple files using aws.s3 commands.  We provide an example using the `aws.s3` package in R for downloading all the ensemble members for particular location, forecast cycle (00, 06, 12, or 18), and NEON site at:

https://github.com/eco4cast/neon4cast-shared-utilities/blob/main/download_noaa_files_s3.R

Additionally we provide example code in R for converting the netcdf files to csv files

https://github.com/eco4cast/neon4cast-shared-utilities/blob/main/noaa_gefs_read_example.R

https://github.com/eco4cast/neon4cast-shared-utilities/blob/main/noaa_gefs_read.R

## Meteorology: NOAA Global Ensemble Forecasting System

[1 Hour NOAA Drivers](https://data.ecoforecast.org/minio/drivers/noaa/NOAAGEFS_1hr/)

## Meteorology: NEON Observed

In development through collaboration with NEON and NCAR.