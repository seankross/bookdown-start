# Submission instructions

### Forecast format

Teams will submit their forecasts as a single netCDF or csv file with the following naming convention:

`theme_name-year-month-day-team_name_ID.csv`

or

`theme_name-year-month-day-team_name_ID.nc`

Where `year`, `month`, and `day` are the year, month, and day for the first day of the submitted forecast and the `team_name_ID` is the code for the team name that is specified in the registration (`team_name_ID` is a 10 character name with no spaces in it). 

The `theme_name` options are: `terrestrial_daily`, `terrestrial_30min`, `aquatics`, `beetles`, `ticks`, or `phenology`. 

Forecast netCDF or csv files should have the following columns (csv) or variables (netcdf) that correspond to the columns.

#### Terrestrial

- `time`: YYYY-MM-DD HH:MM UTC of the start of the 30-minute value or YYYY-MM-DD for daily forecasts
- `siteID`: NEON code for site
- `ensemble`*: integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample)
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `nee`: net ecosystem exchange (umol CO2 m-2 s-1)
- `le`: latent heat (W m-2)
- `vswc`: volumetric soil water content (%)

#### Beetles

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week that is forecasted)
- `siteID`: NEON code for site
- `ensemble`*: integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample)
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `abundance`: abundance of beetles
- `richness`: species richness of beetles 

#### Aquatics

- `time`: YYYY-MM-DD of forecast
- `siteID`: NEON code for site
- `ensemble`*: integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample)
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `oxygen`: dissolved oxygen (ug/L)
- `temp`: water temperature (C)

Here is an example of a forecast file that meets the standard for the aquatics theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/aquatics/aquatics-2021-03-01-EFInull.csv.gz")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   time = col_date(format = ""),
##   ensemble = col_double(),
##   siteID = col_character(),
##   oxygen = col_double(),
##   temperature = col_double(),
##   obs_flag = col_double(),
##   forecast = col_double(),
##   data_assimilation = col_double()
## )
```

```
## # A tibble: 28,000 x 8
##    time       ensemble siteID oxygen temperature obs_flag forecast
##    <date>        <dbl> <chr>   <dbl>       <dbl>    <dbl>    <dbl>
##  1 2021-03-01        1 BARC     8.98        19.1        2        1
##  2 2021-03-01        2 BARC     8.67        21.6        2        1
##  3 2021-03-01        3 BARC     8.73        28.9        2        1
##  4 2021-03-01        4 BARC     8.12        28.2        2        1
##  5 2021-03-01        5 BARC     8.18        17.6        2        1
##  6 2021-03-01        6 BARC     8.70        34.1        2        1
##  7 2021-03-01        7 BARC     8.83        14.9        2        1
##  8 2021-03-01        8 BARC     8.25        23.7        2        1
##  9 2021-03-01        9 BARC     8.47        15.0        2        1
## 10 2021-03-01       10 BARC     8.68        26.3        2        1
## # … with 27,990 more rows, and 1 more variable: data_assimilation <dbl>
```

#### Phenology

- `time`: YYYY-MM-DD
- `siteID`: NEON code for site
- `ensemble`*: integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample)
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `gcc_90`: green chromatic coordinate

Here is an example of a forecast file that meets the standard for the phenology theme



#### Ticks

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week that is forecasted)
- `siteID`: NEON code for site
- `plotID`: NEON plotID
- `ensemble`*: integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample)
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `amblyomma_americanum`: Number of *Amblyomma americanum* nymphs per plot per week
- `ixodes_scapularis`: Number of *Ixodes scapularis* nymphs per plot per week

*Teams that are NOT using ensemble-based forecast methods should replace the ensemble column with a statistic column. Multiple statistics can be reported using a long format in a csv or adding a statistic dimension in netCDF. The required options for this column are `mean` and `sd` (standard deviation). You can also include `Conf_interv_02.5`, `Conf_interv_97.5`, `Pred_interval_02.5`, and `Pred_interval_97.5` to describe uncertainty but these are optional. The numbers in the last four options indicate equal-tail quantiles for a 95% interval estimate and `Conf_`=confidence and `Pred_`=predictive. If statistics are reported we will make a Gaussian assumption when calculating error scores. The Continuous Ranked Probability Score is based on the predictive distribution so reported `sd` should be for the predictive distribution.

For those using netCDF, the order of dimensions on forecast variables should be: `time`, `site`, `plot` [ticks only], and `ensemble`.  In practice using a netCDF for the forecast forecast with the `statistic` rather than `ensemble` is not ideal.

Additional detail about file formats can be found in the EFI Forecast Standard Documentation.

### Metadata format

Each submission requires a metadata file to be submitted. The metadata file must have the same name as the submitted forecast, but with the .xml extension. Model descriptions can be uploaded to https://data.ecoforecast.org/minio/submissions/

`theme_name-year-month-day-team_name_ID.xml`

The metadata standard has been designed by the Ecological Forecasting Initiative and is build off the widely used Ecological Metadata Language (EML).

The following components are required:
- Title  
- pubDate: date that forecast is generated    
- License: See below for details  
- Creator(s)  
- Spatial and temporal coverage   
- File descriptions  
- Model timestep   
- forecast_horizon (length)   
- forecast_issue_time   
- forecast_iteration_id   
- forecast_project_id: team_name_ID (e.g., `EFI_NULL`)    
- model_description which includes: forecast_model_id, model name, type (statistical, process-based, machine-learning, etc), and repository (url or DOI).   
- Info on model structure and uncertainty (standards section 2.1.2)    

The license for the forecast output is required to be from the following Creative Commons License options: CC BY, CC BY-SA, CC BY-NC, CC BY-NC-SA. While we recommend a CC BY license, teams may use less permissive CC licenses if more appropriate. The license entry can be the CC option (i.e., CC BY) and a web link to the full CC license (e.g., https://creativecommons.org/licenses/by/4.0/)

We recommend teams read the full metadata standard description for definitions and more information, and in particular that they look at the example vignettes, which demonstrate the standard being used. Note that these Standards are a work in progress. If you find issues as you are applying them, let us know at eco4cast.initaitive@gmail.com.

The Ecological Forecasting Initiative has provided R scripts to assist in generating the metadata XML file. The scripts can be found at the GitHub repository for the standard: https://github.com/eco4cast/EFIstandards as well as the EML validator. Teams are encouraged to check the validity of their metadata before submission.

### Submission process

Individual forecast (csv, netCDF) and metadate (xml) files can be uploaded any time before the specific deadlines as defined by each theme. Only the most recent files will be scored. 

Teams will submit their forecast netCDF or csv files through the challenge website. You can manually submit your forecast through the https://data.ecoforecast.org/minio/submissions/ website using the red plus on the bottom left. You can submit from an R script using the following:


```r
Sys.setenv("AWS_DEFAULT_REGION" = "data",
           "AWS_S3_ENDPOINT" = "ecoforecast.org")

aws.s3::put_object(object = "theme_name-forecast-year-month-day-team_name.csv", bucket = "submissions")
```


Submissions need to adhere to the forecast format that is provided above, including the file naming convention. Our cyberinfastructure automatically evaluates forecasts and relies on the expected formatting. Contact eco4cast.initiative@gmail.com if you experience technical issues with submitting.

Note: If you have used AWS in the past you might have credential files in an .aws folder in your home directory that will cause an error when you try to upload to a non-AWS bucket. If you encounter this error you may need to rename your credentials files so put_object doesn't try to read them.
