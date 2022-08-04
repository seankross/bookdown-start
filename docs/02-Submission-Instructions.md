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

Here is an example of a netcdf forecast file that meets the standard for the 30 minute terrestrial theme.  The file is located at https://data.ecoforecast.org/forecasts/terrestrial/terrestrial_30min-2022-02-15-hist30min.nc

### Terrestrial Daily

Note: remember this theme is "terrestrial_daily"

- `time`: YYYY-MM-DD 
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).         
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: [Optional] set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `nee`: g C m<sup>-2</sup> day<sup>-1</sup> for daily forecasts)
- `le`: latent heat (W m<sup>-2</sup>)

If you only forecast nee or le, you can exclude the other variable from the file

Here is an example of a csv forecast file that meets the standard for the daily terrestrial theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/terrestrial_daily/terrestrial_daily-2022-02-15-climatology.csv.gz")
```

```
## Rows: 720 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): siteID, statistic
## dbl  (3): forecast, nee, le
## date (1): time
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 720 × 6
##    time       siteID statistic forecast   nee    le
##    <date>     <chr>  <chr>        <dbl> <dbl> <dbl>
##  1 2022-02-15 BART   mean             1 0.630  2.80
##  2 2022-02-15 BART   sd               1 0.243  6.87
##  3 2022-02-16 BART   mean             1 0.584 10.7 
##  4 2022-02-16 BART   sd               1 0.243  6.87
##  5 2022-02-17 BART   mean             1 0.505  7.22
##  6 2022-02-17 BART   sd               1 0.243  6.87
##  7 2022-02-18 BART   mean             1 0.855  5.36
##  8 2022-02-18 BART   sd               1 0.243  6.87
##  9 2022-02-19 BART   mean             1 0.639 15.5 
## 10 2022-02-19 BART   sd               1 0.243  6.87
## # … with 710 more rows
```



### Beetles

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week that is forecasted)
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).          
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: [Optional] set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `abundance`: abundance of beetles
- `richness`: species richness of beetles 

Here is an example of a csv forecast file that meets the standard for the beetles theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/beetles/beetles-2021-07-01-cb_f2.csv.gz")
```

```
## Rows: 4888 Columns: 5
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): siteID, statistic
## dbl  (2): richness, abundance
## date (1): time
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 4,888 × 5
##    time       siteID statistic richness abundance
##    <date>     <chr>  <chr>        <dbl>     <dbl>
##  1 2021-06-28 ABBY   mean         10.7      0.353
##  2 2021-06-28 ABBY   sd            2.38     0.279
##  3 2021-07-05 ABBY   mean         10.7      0.353
##  4 2021-07-05 ABBY   sd            2.38     0.279
##  5 2021-07-12 ABBY   mean         10.7      0.353
##  6 2021-07-12 ABBY   sd            2.38     0.279
##  7 2021-07-19 ABBY   mean         10.7      0.353
##  8 2021-07-19 ABBY   sd            2.38     0.279
##  9 2021-07-26 ABBY   mean         10.7      0.353
## 10 2021-07-26 ABBY   sd            2.38     0.279
## # … with 4,878 more rows
```

### Aquatics

- `time`: YYYY-MM-DD of forecast
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).          
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: [Optional] set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `temperature`: water temperature (C)
- `oxygen`: dissolved oxygen (mg/L)
- `chla`: chlorophyll-a (mg/L)

Here is an example of a csv forecast file that meets the standard for the aquatics theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/aquatics/aquatics-2022-02-15-climatology.csv.gz")
```

```
## Rows: 288 Columns: 7
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): siteID, statistic
## dbl  (4): forecast, oxygen, chla, temperature
## date (1): time
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 288 × 7
##    time       siteID statistic forecast oxygen  chla temperature
##    <date>     <chr>  <chr>        <dbl>  <dbl> <dbl>       <dbl>
##  1 2022-02-15 BARC   mean             1  8.83   8.83       18.6 
##  2 2022-02-15 BARC   sd               1  0.205  1.07        1.26
##  3 2022-02-16 BARC   mean             1  8.82   8.82       18.7 
##  4 2022-02-16 BARC   sd               1  0.205  1.07        1.26
##  5 2022-02-17 BARC   mean             1  8.77   8.77       18.9 
##  6 2022-02-17 BARC   sd               1  0.205  1.07        1.26
##  7 2022-02-18 BARC   mean             1  8.78   8.78       19.5 
##  8 2022-02-18 BARC   sd               1  0.205  1.07        1.26
##  9 2022-02-19 BARC   mean             1  8.77   8.77       20.3 
## 10 2022-02-19 BARC   sd               1  0.205  1.07        1.26
## # … with 278 more rows
```

### Phenology

- `time`: YYYY-MM-DD
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).    
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: [Optional] set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `gcc_90`: green chromatic coordinate
- `rcc_90`: red chromatic coordinate

Here is are examples of csv forecast files that meet the standard for the phenology theme


```r
readr::read_csv("https://data.ecoforecast.org/forecasts/phenology/phenology-2022-02-14-climatology.csv.gz")
```

```
## Rows: 1296 Columns: 6
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (2): siteID, statistic
## dbl  (3): forecast, gcc_90, rcc_90
## date (1): time
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

```
## # A tibble: 1,296 × 6
##    time       siteID statistic forecast  gcc_90 rcc_90
##    <date>     <chr>  <chr>        <dbl>   <dbl>  <dbl>
##  1 2022-02-14 BART   mean             1 0.344   0.370 
##  2 2022-02-14 BART   sd               1 0.00178 0.0104
##  3 2022-02-15 BART   mean             1 0.347   0.353 
##  4 2022-02-15 BART   sd               1 0.00178 0.0104
##  5 2022-02-16 BART   mean             1 0.346   0.364 
##  6 2022-02-16 BART   sd               1 0.00178 0.0104
##  7 2022-02-17 BART   mean             1 0.344   0.374 
##  8 2022-02-17 BART   sd               1 0.00178 0.0104
##  9 2022-02-18 BART   mean             1 0.347   0.362 
## 10 2022-02-18 BART   sd               1 0.00178 0.0104
## # … with 1,286 more rows
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

- `time`: YYYY-MM-DD of forecast (where the DD is the first day of the week (Sunday) that is forecasted). Defined by `MMWRweek::MMWRweek2Date(Year, mmwrWeek)`
- `siteID`: NEON code for site
- `ensemble` or `statistic`: if `ensemble` then integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample); if `statistic` then either required to be the string `mean` or `sd` (see note below about statistic column).        
- `forecast`: set as 1 for each row (1 = variables were forecasted; a 0 would designate a hindcast which does not apply to submissions to the challenge)
- `data_assimilation`: set as 0 for each row (0 = no data assimilation occurred because it is a forecast)
- `amblyomma_americanum`: Density of *Amblyomma americanum* nymphs 

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

To help support metadata generation, we have created a function in the neon4cast package (`generate_metadata()`) and a guide for completing the metadata: [Metadata]

The license for the forecast output is required to be from the following Creative Commons License options: CC BY, CC BY-SA, CC BY-NC, CC BY-NC-SA. While we recommend a CC BY license, teams may use less permissive CC licenses if more appropriate. The license entry can be the CC option (i.e., CC BY) and a web link to the full CC license (e.g., https://creativecommons.org/licenses/by/4.0/)

We recommend teams read the full metadata standard description for definitions and more information, and in particular that they look at the [example vignettes](https://github.com/eco4cast/EFIstandards/tree/master/vignettes){target="_blank"}, which demonstrate the standard being used. Note that these Standards are a work in progress. If you find issues as you are applying them, let us know at **eco4cast.initaitive@gmail.com**.

## Submission process

Individual forecast (csv, netCDF) and metadate (xml) files can be uploaded any time before the specific deadlines as defined by each theme. Only the most recent files will be scored. 

**The correct file name and format is critical for the automated processing of submissions**

Teams will submit their forecast netCDF or csv files manually through the challenge website or with an R script. 

- You can submit from an R script using the following:

```r
Sys.setenv("AWS_DEFAULT_REGION" = "data",
           "AWS_S3_ENDPOINT" = "ecoforecast.org")

aws.s3::put_object(object = "theme_name-year-month-day-team_name.csv", bucket = "submissions")
aws.s3::put_object(object = "theme_name-year-month-day-team_name.xml", bucket = "submissions")
```
- Finally, we have developed a function called submit in the `neon4cast` package handles submission process. Internally it performs the `aws.s3` commands in option two and executes the submission \@ref(neon4cast-submit):

```r
neon4cast::submit(forecast_file = "theme_name-forecast-year-month-day-team_name.csv",
                  metadata = "theme_name-year-month-day-team_name.xml")
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
