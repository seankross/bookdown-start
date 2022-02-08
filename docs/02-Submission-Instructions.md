# Submission Instructions

The following provides the requirements for the format of the forecasts that will be submitted. It is important to follow these format guidelines in order for your submitted forecasts to pass a set of internal checks that allow the forecast to be visualized on the [NEON Ecological Forecast Challenge dashboard](http://shiny.ecoforecast.org/){target="_blank"}  and evaluated with the scoring process.


## Forecast format

Teams will submit their forecasts as a single netCDF or csv file with the following naming convention (**the correct naming convention is critical for the automated processing of submissions**):

`theme_name-year-month-day-team_name_ID.csv`

or

`theme_name-year-month-day-team_name_ID.nc`

Where `year`, `month`, and `day` are the year, month, and day for the first day of the submitted forecast and the `team_name_ID` is the code for the team name that is specified in the registration (`team_name_ID` is a 10 character name with no spaces in it). 

The `theme_name` options are: `terrestrial_daily`, `terrestrial_30min`, `aquatics`, `beetles`, `ticks`, or `phenology`. 

Forecast netCDF or csv files should have the following columns (csv) or variables (netcdf) that correspond to the columns.

There are two key options for the format.  First, the file can be either in a csv or a netcdf format. Second the file can represent uncertainty using an ensemble column or a statistic column.  The ensemble column uses an integer to individual each ensemble member or MCMC member that represent forecast uncertainty.  The statistic column uses the words `mean` or `sd` to describe which statistic is represented in the forecasted target column.

**Note for submissions with a `statistic` column option:**  Teams that are NOT using ensemble-based forecast methods should replace the ensemble column with a statistic column. Multiple statistics can be reported using a long format in a csv or adding a statistic dimension in netCDF. The required options for this column are `mean` and `sd` (standard deviation). You can also include `Conf_interv_02.5`, `Conf_interv_97.5`, `Pred_interval_02.5`, and `Pred_interval_97.5` to describe uncertainty but these are optional. The numbers in the last four options indicate equal-tail quantiles for a 95% interval estimate and `Conf_`=confidence and `Pred_`=predictive. If statistics are reported we will make a Gaussian assumption when calculating error scores. The Continuous Ranked Probability Score is based on the predictive distribution so reported `sd` should be for the predictive distribution.    

**Note for those using netCDF option**, the order of dimensions on forecast variables should be: `time`, `site`, `plot` [ticks only], and `ensemble`.  In practice using a netCDF for the forecast  with the `statistic` rather than `ensemble` is not ideal.

Below are examples of the forecast file format for each theme. **The correct file format is critical for the automated processing of submissions**

### Terrestrial 30 min

Note: remember this theme is "terrestrial_30min"

- `time`: YYYY-MM-DD HH:MM UTC of the start of the 30-minute value
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).         
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `nee`: net ecosystem exchange (umol CO2 m<sup>-2</sup> s<sup>-1</sup> for 30 minute forecast
- `le`: latent heat (W m<sup>-2</sup>)

If you only forecast nee or le, you can exclude the other variable from the file

Here is an example of a netcdf forecast file that meets the standard for the 30 minute terrestrial theme.  The file is located at https://data.ecoforecast.org/forecasts/terrestrial/terrestrial_30min-2021-04-01-hist30min.nc

### Terrestrial Daily

Note: remember this theme is "terrestrial_daily"

- `time`: YYYY-MM-DD 
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).         
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `nee`: g C m<sup>-2</sup> day<sup>-1</sup> for daily forecasts)
- `le`: latent heat (W m<sup>-2</sup>)

If you only forecast nee or le, you can exclude the other variable from the file

Here is an example of a csv forecast file that meets the standard for the daily terrestrial theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/terrestrial_daily/terrestrial_daily-2020-10-01-EFInulldaily.csv.gz")
```

```
## Rows: 272000 Columns: 9
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): siteID
## dbl  (7): ensemble, obs_flag, nee, le, vswc, forecast, data_assimilation
## date (1): time
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 272,000 × 9
##    time       ensemble siteID obs_flag    nee     le   vswc forecast
##    <date>        <dbl> <chr>     <dbl>  <dbl>  <dbl>  <dbl>    <dbl>
##  1 2020-10-02        1 BART          2 -29.6  -114.  0.0220        1
##  2 2020-10-02        2 BART          2 -21.1    49.9 0.191         1
##  3 2020-10-02        3 BART          2  -5.70  344.  0.0792        1
##  4 2020-10-02        4 BART          2   4.76  547.  0.0982        1
##  5 2020-10-02        5 BART          2 -18.6    94.8 0.0883        1
##  6 2020-10-02        6 BART          2  -4.32  375.  0.192         1
##  7 2020-10-02        7 BART          2  -2.51  408.  0.127         1
##  8 2020-10-02        8 BART          2 -10.5   255.  0.198         1
##  9 2020-10-02        9 BART          2 -33.3  -184.  0.157         1
## 10 2020-10-02       10 BART          2 -10.7   250.  0.109         1
## # … with 271,990 more rows, and 1 more variable: data_assimilation <dbl>
```



### Beetles

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week that is forecasted)
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).          
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `abundance`: abundance of beetles
- `richness`: species richness of beetles 

Here is an example of a csv forecast file that meets the standard for the beetles theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/beetles/beetles-2020-EFI_avg_null.csv.gz")
```

```
## Rows: 441000 Columns: 5
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): siteID
## dbl  (3): ensemble, richness, abundance
## date (1): time
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 441,000 × 5
##    siteID time       ensemble richness abundance
##    <chr>  <date>        <dbl>    <dbl>     <dbl>
##  1 SJER   2020-01-06        1     2.84   0.0243 
##  2 SJER   2020-01-06        2     3.22   0.00783
##  3 SJER   2020-01-06        3     2.05   0.0211 
##  4 SJER   2020-01-06        4     1.04   0.0209 
##  5 SJER   2020-01-06        5     2.58   0.0304 
##  6 SJER   2020-01-06        6     4.00   0.0164 
##  7 SJER   2020-01-06        7     2.91   0.0200 
##  8 SJER   2020-01-06        8     3.17   0.0146 
##  9 SJER   2020-01-06        9     3.67   0.0115 
## 10 SJER   2020-01-06       10     2.41   0.0196 
## # … with 440,990 more rows
```

### Aquatics

- `time`: YYYY-MM-DD of forecast
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).          
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `oxygen`: dissolved oxygen (mg/L)
- `temp`: water temperature (C)

Here is an example of a csv forecast file that meets the standard for the aquatics theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/aquatics/aquatics-2021-03-01-EFInull.csv.gz")
```

```
## Rows: 28000 Columns: 8
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (1): siteID
## dbl  (6): ensemble, oxygen, temperature, obs_flag, forecast, data_assimilation
## date (1): time
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 28,000 × 8
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

### Phenology

- `time`: YYYY-MM-DD
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).    
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `gcc_90`: green chromatic coordinate
- `rcc_90`: red chromatic coordinate

Here is are examples of csv forecast files that meet the standard for the phenology theme. There will be an extra column called `rcc_90` when `rcc_90` is included in the forecast.


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/phenology/phenology-2021-08-09-PEG_FUSION_0.csv")
```

```
## Rows: 528 Columns: 5
```

```
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): siteID, statistic
## dbl  (2): gcc_90, rcc_90
## date (1): time
```

```
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 528 × 5
##    time       siteID statistic  gcc_90 rcc_90
##    <date>     <chr>  <chr>       <dbl>  <dbl>
##  1 2021-08-10 HARV   mean      0.418   0.409 
##  2 2021-08-10 HARV   sd        0.00280 0.0129
##  3 2021-08-11 HARV   mean      0.416   0.407 
##  4 2021-08-11 HARV   sd        0.00125 0.0120
##  5 2021-08-12 HARV   mean      0.418   0.408 
##  6 2021-08-12 HARV   sd        0.00293 0.0129
##  7 2021-08-13 HARV   mean      0.417   0.406 
##  8 2021-08-13 HARV   sd        0.00307 0.0120
##  9 2021-08-14 HARV   mean      0.418   0.406 
## 10 2021-08-14 HARV   sd        0.00325 0.0104
## # … with 518 more rows
```

A netcdf file located at https://data.ecoforecast.org/forecasts/phenology/phenology-2021-02-23-EFInull.nc


```r
ncdf4::nc_open("images/phenology-2021-02-23-EFInull.nc")
```

```
## File images/phenology-2021-02-23-EFInull.nc (NC_FORMAT_NETCDF4):
## 
##      2 variables (excluding dimension variables):
##         float gcc_90[time,site,ensemble]   (Contiguous storage)  
##             long_name: 90% quantile of daily green chromatic coordinate
##         char siteID[nchar,site]   (Contiguous storage)  
## 
##      4 dimensions:
##         time  Size:35 
##             units: days since 2021-02-23
##             long_name: time
##         site  Size:8 
##             long_name: siteID
##         ensemble  Size:2000 
##             long_name: ensemble member
##         nchar  Size:4 (no dimvar)
## 
##     3 global attributes:
##         forecast_project_id: EFInull
##         forecast_model_id: v0.1
##         forecast_iteration_id: 2021-02-23 22:10:34
```

### Ticks

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week that is forecasted). Defined by `MMWRweek::MMWRweek2Date(Year, epiWeek)`
- `siteID`: NEON code for site
- `plotID`: NEON plotID
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).        
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `amblyomma_americanum`: Number of *Amblyomma americanum* nymphs per plot per week
- `ixodes_scapularis`: Number of *Ixodes scapularis* nymphs per plot per week

Here is an example of a csv forecast file that meets the standard for the ticks theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/ticks/ticks-2019-03-04-tickGlobalNull_RandomWalk.csv.gz")
```

```
## # A tibble: 77,000 × 10
##     ...1 time       ixodes_scapularis plotID   siteID ensemble data_assimilation
##    <dbl> <date>                 <dbl> <chr>    <chr>     <dbl>             <dbl>
##  1     1 2019-03-04             0.341 BLAN_012 BLAN          1                 0
##  2     2 2019-03-11             0.286 BLAN_012 BLAN          1                 0
##  3     3 2019-03-18             0.372 BLAN_012 BLAN          1                 0
##  4     4 2019-03-25             0.349 BLAN_012 BLAN          1                 0
##  5     5 2019-04-01             0.368 BLAN_012 BLAN          1                 0
##  6     6 2019-04-08             0.443 BLAN_012 BLAN          1                 0
##  7     7 2019-04-15             0.455 BLAN_012 BLAN          1                 0
##  8     8 2019-04-22             0.367 BLAN_012 BLAN          1                 0
##  9     9 2019-04-29             0.368 BLAN_012 BLAN          1                 0
## 10    10 2019-05-06             0.327 BLAN_012 BLAN          1                 0
## # … with 76,990 more rows, and 3 more variables: forecast <dbl>,
## #   obs_flag <dbl>, amblyomma_americanum <dbl>
```

## Metadata format

Each submission requires a metadata file to be submitted. The metadata file must have the same name as the submitted forecast, but with the .xml extension.  

`theme_name-year-month-day-team_name_ID.xml`

Metadata files should be uploaded with the forecast files.

The [metadata standard](https://github.com/eco4cast/EFIstandards){target="_blank"}  has been designed by the Ecological Forecasting Initiative and is built off the widely used Ecological Metadata Language (EML).

To help support metadata generation, we have created two helpful functions in the neon4cast package.  

First, the `neon4cast::create_model_metadata(forecast_file)` function will open a file that has the same name as your forecast file but with a `yml` extension.  You will modify the fields in this file and save it.  The are comments in the yml to help you with the information and a document describing the the fields [here](https://shorturl.at/irMQW){target="_blank"} 

Second, the `neon4cast::write_metadata_eml(forecast_file =  forecast_file ,metadata_yaml = metadata_yaml, forecast_issue_time = Sys.Date(), forecast_iteration_id = "1")` will use the information in your forecast file and the yml that you saved from `neon4cast::create_model_metadata()` to generate the xml file that you will submit.

`neon4cast::write_metadata_eml` uses a function that you can use outside neon4cast::write_metadata_eml to valdiate the xml files.  While `neon4cast::write_metadata_eml` does the validation internally, you check the validity of their metadata before submission using the [validator script](https://github.com/eco4cast/EFIstandards/blob/master/R/forecast_validator.R){target="_blank"}.

The license for the forecast output is required to be from the following Creative Commons License options: CC BY, CC BY-SA, CC BY-NC, CC BY-NC-SA. While we recommend a CC BY license, teams may use less permissive CC licenses if more appropriate. The license entry can be the CC option (i.e., CC BY) and a web link to the full CC license (e.g., https://creativecommons.org/licenses/by/4.0/)

We recommend teams read the full metadata standard description for definitions and more information, and in particular that they look at the [example vignettes](https://github.com/eco4cast/EFIstandards/tree/master/vignettes){target="_blank"}, which demonstrate the standard being used. Note that these Standards are a work in progress. If you find issues as you are applying them, let us know at **eco4cast.initaitive@gmail.com**.

## Submission process

Individual forecast (csv, netCDF) and metadate (xml) files can be uploaded any time before the specific deadlines as defined by each theme. Only the most recent files will be scored. 

**The correct file name and format is critical for the automated processing of submissions**

Teams will submit their forecast netCDF or csv files manually through the challenge website or with an R script. 

- You can manually submit your forecast through the https://data.ecoforecast.org/minio/submissions/ website using the red plus on the bottom right   
- You can submit from an R script using the following:

```r
Sys.setenv("AWS_DEFAULT_REGION" = "data",
           "AWS_S3_ENDPOINT" = "ecoforecast.org")

aws.s3::put_object(object = "theme_name-forecast-year-month-day-team_name.csv", bucket = "submissions")
aws.s3::put_object(object = "theme_name-year-month-day-team_name_ID.xml", bucket = "submissions")
```
- Finally, we have developed a function called submit in the `neon4cast` package handles submission process. Internally it performs the `aws.s3` commands in option two and executes the submission \@ref(neon4cast-submit):

```r
neon4cast::submit(forecast_file = "theme_name-forecast-year-month-day-team_name.csv",
                  metadata = "theme_name-year-month-day-team_name_ID.xml")
```


Submissions need to adhere to the forecast format that is provided above, including the file naming convention. Our cyberinfastructure automatically evaluates forecasts and relies on the expected formatting. Contact eco4cast.initiative@gmail.com if you experience technical issues with submitting.

**Note:** If you have used AWS in the past you might have credential files in an .aws folder in your home directory that will cause an error when you try to upload to a non-AWS bucket. If you encounter this error you may need to rename your credentials files so put_object doesn't try to read them.

## Validating submission

You can check the status of your submssion using the following function in the `neon4cast` package


```r
neon4cast::check_submission("phenology-2022-02-07-persistence.nc")
```

```
## Submission was successfully processed
```

A successful submission can be found at the following links within 2 hours of submissions

We run a validator script when processing the submissions. If your submission does not meet the file standards above, you can run a function that provides information describing potential issues.  The forecast file needs to be in your local working directory or you need to provide a full path to the file


```r
neon4cast::forecast_output_validator("phenology-2022-02-07-persistence.nc")
```

## Visualizing submissions

Plots of submissions and table of scores can be found at our [dashboard](https://shiny.ecoforecast.org){target="_blank"} 

## Video Describing How to Submit to the Challenge

This video was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/S8x5rLtltDU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
