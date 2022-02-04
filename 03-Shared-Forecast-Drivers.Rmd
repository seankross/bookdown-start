# Meteorology Inputs{#met_inputs}

We are downloading, subsetting, and processing forecasted meteorology drivers for each NEON site.  Currently, we have NOAA’s Global Ensemble Forecasting System (GEFS) V12 output available at the 1 hr time resolution for each NEON site.  

The following are important considerations when using the NOAA GEFS forecasts

- There are 31 ensemble members for each forecast.  Each ensemble member is available as a separate netcdf file.  
- For forecasts generated at four times per day.  The directories are organized by these cycles: 00, 06, 12, and 18 cycles
- For the midnight (00) UTC, the forecasts extend 35-days in the future for the ensemble members 01 - 30.  Ensemble member 00 only extends 16-days in the future.
- For forecasts generated at 06, 12, and 18 UTC, the forecasts extend 16-days in the future.  
- We are constantly downloading and processing the forecasts.  Since the 00 forecast runs 35-days in the future, it takes longer to download the complete forecast than the 06, 12, and 18 cycles.  As a result you may see the 00 forecast appear later than the other forecasts on the server.

The following meteorological variables are included:   
- air temperature   
- air pressure  
- wind speed   
- precipitation   
- downwelling longwave radiation   
- downwelling shortwave radiation   
- relative humidity   

The weather forecasts are available through an s3 bucket (see NOAA Global Ensemble Forecasting System below) with multiple ways to access them:
- You can click on a file in the browser, you can directly download individual files from the command line using the file address
- You can download multiple files using `aws.s3` commands.
- We provide an R function code in the [neon4cast package](https://github.com/eco4cast/neon4cast) called `noaa.R` for downloading all the ensemble members for particular location, forecast cycle (00, 06, 12, or 18), and NEON site

Additionally, we provide an R function code in the [neon4cast package](https://github.com/eco4cast/neon4cast) called `read_forecast.R` for converting the download netcdf files to a data frame.


## NOAA Global Ensemble Forecasting System

[1 Hour NOAA Drivers](https://data.ecoforecast.org/minio/drivers/noaa/NOAAGEFS_1hr/){target="_blank"}\

The data are organized by siteID/date/cycle where cycle is the hour of the day (UTC) that the forecast was started (00, 06, 12, 18).

## NOAA Global Ensemble Forecasting System Stacked

We have extracted the first hour of each NOAA GEFS forecast since September 2020 and combined them together to generate a continuous weather product that runs from September 2020 to present.  This is available for model calibration and seamlessly transitions to the current day's NOAA GEFS forecast

[Historical NOAA Drivers](https://data.ecoforecast.org/minio/drivers/noaa/NOAAGEFS_1hr_stacked/){target="_blank"}\

The data are organized by siteID.

## NEON Observed

Our goal is to make the observed weather at each NEON site available. This is currently in development through a collaboration with NEON and NCAR.

