# Helpful Functions

The following are resources to help you prepare your forecasts for submission. 

The [neon4cast](https://github.com/eco4cast/neon4cast){target="_blank"} package provides a collection of convenient helper utilities so you can score your forecast locally, validate the format of your forecast files to check for formatting errors before submitting, generate forecast metadata in EML (coming soon!), access EFI snapshots of NOAA forecasts at NEON sites, and submit your forecast. 

The [neonstore](https://github.com/cboettig/neonstore){target="_blank"} package provides quick access and persistent storage of NEON data tables. 

The [EFIstandards](https://github.com/eco4cast/EFIstandards){target="_blank"} package summarizes the proposed community standards for the common formatting and archiving of ecological forecasts by the Ecological Forecasting Initiative. These standards are a work in progress. If you have suggestions for improvement share them with eco4cast.initiative@gmail.com.”


## neon4cast package

The `neon4cast` package is located at https://github.com/eco4cast/neon4cast

`neon4cast` provides the following collection of convenient helper utilities for
anyone entering the EFI NEON Forecasting Challenge.

### Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("eco4cast/neon4cast")
```

### Example forecast

``` r
library(neon4cast)
library(tidyverse)
library(fable)
library(tsibble)
```

Download and read in the current target file for the Aquatics theme. For
convenience, we read this in as a timeseries object, noting that the
time is in the ‘time’ column, and timeseries are replicated over sites.

``` r
aquatic <- read_csv("https://data.ecoforecast.org/targets/aquatics/aquatics-targets.csv.gz") %>% 
  as_tsibble(index=time, key=siteID)
```

Create a 35 day forecast for each variable, `oxygen`, and `temperature`.
For illustrative purposes, we’ll use the `fable` package because it is
concise and well documented. We make separate forecasts for each of the
two variables before reformatting them and combining them. Note the use
of `efi_format` helper function from the `neon4cast` package, which
merely replaces the special `<S3:distribution>` column used by fable
with something we can write to text: either columns with a mean/sd (for
normal distributions) or otherwise random draws from the distributions.

So that we can score our forecast right away instead of waiting for next
month’s data, we will filter out the most recent data available first.

``` r
# drop last 35 days and use explicit NAs for gaps in timeseries
blinded_aquatic <- aquatic %>% filter(time < max(time) - 35) %>% fill_gaps()

# A simple random walk forecast, see ?fable::RW
oxygen_fc <- blinded_aquatic %>%
  model(null = RW(oxygen)) %>%
  forecast(h = "35 days") %>%
  efi_format()

## also use random walk for temperature
temperature_fc <- blinded_aquatic  %>%
  model(null = RW(temperature)) %>%
  forecast(h = "35 days") %>%
  efi_format()

# combine into single table, drop the .model column
forecast <- inner_join(oxygen_fc, temperature_fc) %>% select(-.model)

## Write the forecast to a file following EFI naming conventions:
forecast_file <- glue::glue("{theme}-{date}-{team}.csv.gz",
                            theme = "aquatics", 
                            date=Sys.Date(),
                            team = "example_null")
write_csv(forecast, forecast_file)
```

### Score forecast locally

Scores for valid forecasts should appear at
<https://shiny.ecoforecast.org> the day after they are submitted.
However, it is often more convenient to generate scores locally. Note
that the “score” simply the `crps_sample` (for ensemble forecasts) or
`crps_norm` (for summary statistic forecasts) score from the
`scoringRules` R package, for each unique prediction
(i.e.day/site/variable tuple).

Note that scores are only possible once the data becomes available in
the corresponding targets file!

``` r
scores <- score(forecast, theme = "aquatics")

# The resulting data.frame scores each day for each site, but is also easy to summarize:
scores %>% 
  group_by(siteID, target) %>% 
  summarise(mean_score = mean(score, na.rm=TRUE))
#> # A tibble: 4 x 3
#>   siteID target      mean_score
#>   <chr>  <chr>            <dbl>
#> 1 BARC   oxygen           0.677
#> 2 BARC   temperature    NaN    
#> 3 POSE   oxygen           0.676
#> 4 POSE   temperature      1.42
```

### Validate a forecast file

Validating a forecast file runs the same automated checks as the EFI
server, verifying that the data is in the correct format for the
appropriate challenge. Helpful errors or warnings will displayed on any
invalid formats. Note that the validator accepts files in `.csv`
(optionally compressed as `.csv.gz`) or netcdf.

``` r
forecast_output_validator(forecast_file)
#> aquatics-2021-03-17-example_null.csv.gz
#> ✓ file name is correct
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   time = col_date(format = ""),
#>   siteID = col_character(),
#>   statistic = col_character(),
#>   oxygen = col_double(),
#>   temperature = col_double()
#> )
#> ✓ target variables found
#> ✓ file has summary statistics column
#> ✓ file has summary statistic: mean
#> ✓ file has summary statistic: sd
#> ✓ file has siteID column
#> ✓ file has time column
#> ✓ file has correct time column
#> [1] TRUE
```

### Generate forecast metadata in EML

The metadata 

First, run 

```
create_model_metadata(forecast_file = forecast_file)        
```

then edit the yml file that is open with the information describing your team and model.  There are comments in the yml to help you complete the information.  You will only need to generate the yml once unless you change the  structure of your model or team members.  This will the `metadata_yaml` in the step step.

Next, run

```
write_metadata_eml(forecast_file =  forecast_file ,metadata_yaml = metadata_yaml, forecast_issue_time = Sys.Date(), forecast_iteration_id = "1")
```

where `forecast_issue_time` is the time that you generated the forecast. `forecast_iteration_id` is a unique identifier of your choice that is associated with that iteration of your forecast.

`write_metadata_eml` will generate the xml that you can submitted along with your forecast file. 

### Access EFI snapshots of NOAA forecasts at NEON sites

Many forecasts will want to make use of weather forecasts as potential
drivers. EFI downscales NOAA GEFS 35-day forecast products at each NEON
site and makes this data available. These helper functions provide
convenient access for downloading and stacking the individual forecast
files.

``` r
aq_sites <- unique(aquatic$siteID)
download_noaa(aq_sites)
noaa_fc <- stack_noaa()
noaa_fc
#> # A tibble: 8,590 x 18
#>    model interval siteID startDate endDate ensemble air_temperature air_pressure
#>    <chr> <chr>    <chr>  <chr>     <chr>   <chr>              <dbl>        <dbl>
#>  1 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            295.      101473.
#>  2 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            291.      101595.
#>  3 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            289.      101595.
#>  4 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            302.      101602.
#>  5 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            296.      101479.
#>  6 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            292.      101553.
#>  7 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            290.      101461.
#>  8 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            302.      101408.
#>  9 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            296.      101281.
#> 10 NOAA… 6hr      BARC   2021-03-… 2021-0… ens00.nc            291.      101360.
#> # … with 8,580 more rows, and 10 more variables: relative_humidity <dbl>,
#> #   surface_downwelling_longwave_flux_in_air <dbl>,
#> #   surface_downwelling_shortwave_flux_in_air <dbl>, precipitation_flux <dbl>,
#> #   specific_humidity <dbl>, cloud_area_fraction <dbl>, wind_speed <dbl>,
#> #   time <dbl>, latitude <dbl>, longitude <dbl>
```


### Submit a forecast {#neon4cast-submit}

When you are ready to submit your forecast to EFI:

``` r
submit(forecast_file)
#> aquatics-2021-03-17-example_null.csv.gz
#> ✓ file name is correct
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   time = col_date(format = ""),
#>   siteID = col_character(),
#>   statistic = col_character(),
#>   oxygen = col_double(),
#>   temperature = col_double()
#> )
#> ✓ target variables found
#> ✓ file has summary statistics column
#> ✓ file has summary statistic: mean
#> ✓ file has summary statistic: sd
#> ✓ file has siteID column
#> ✓ file has time column
#> ✓ file has correct time column
```

Ideally you should include the optional `metadata =` argument with your
metadata file.

## neonstore package

The neonstore package is located at  https://github.com/eco4cast/neon4cast

`neonstore` provides quick access and persistent storage of NEON data tables. `neonstore` emphasizes simplicity and a clean data provenance trail, see Provenance section below.

<!-- badges: start -->

[![R build
status](https://github.com/cboettig/neonstore/workflows/R-CMD-check/badge.svg)](https://github.com/cboettig/neonstore/actions)
[![Codecov test
coverage](https://codecov.io/gh/cboettig/neonstore/branch/master/graph/badge.svg)](https://codecov.io/gh/cboettig/neonstore?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/neonstore)](https://CRAN.R-project.org/package=neonstore)
<!-- badges: end -->

`neonstore` provides quick access and persistent storage of NEON data
tables. `neonstore` emphasizes simplicity and a clean data provenance
trail, see Provenance section below.

### Installation

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cboettig/neonstore")
```

### Quickstart

``` r
library(neonstore)
```

Discover data products of interest:

``` r
products <- neon_products()

i <- grepl("Populations", products$themes)
products[i, c("productCode", "productName")]
#> # A tibble: 50 x 2
#>    productCode   productName                                              
#>    <chr>         <chr>                                                    
#>  1 DP1.00033.001 Phenology images                                         
#>  2 DP1.10003.001 Breeding landbird point counts                           
#>  3 DP1.10010.001 Coarse downed wood log survey                            
#>  4 DP1.10020.001 Ground beetle sequences DNA barcode                      
#>  5 DP1.10022.001 Ground beetles sampled from pitfall traps                
#>  6 DP1.10026.001 Plant foliar traits                                      
#>  7 DP1.10033.001 Litterfall and fine woody debris production and chemistry
#>  8 DP1.10038.001 Mosquito sequences DNA barcode                           
#>  9 DP1.10041.001 Mosquito-borne pathogen status                           
#> 10 DP1.10043.001 Mosquitoes sampled from CO2 traps                        
#> # … with 40 more rows
 
i <- grepl("bird", products$keywords)
products[i, c("productCode", "productName")]
#> # A tibble: 1 x 2
#>   productCode   productName                   
#>   <chr>         <chr>                         
#> 1 DP1.10003.001 Breeding landbird point counts
```

Download all data files in the bird survey data products.

``` r
neon_download("DP1.10003.001")
#>   comparing hashes against local file index...
#>   updating release manifest...
```

View your store of NEON products:

``` r
neon_index()
#> # A tibble: 854 x 15
#>    product  site  table   type  ext   month timestamp           horizontalPosit…
#>    <chr>    <chr> <chr>   <chr> <chr> <chr> <dttm>                         <dbl>
#>  1 DP1.100… BART  brd_co… basic csv   2015… 2020-12-23 14:17:30               NA
#>  2 DP1.100… BART  brd_co… basic csv   2016… 2020-12-23 14:17:14               NA
#>  3 DP1.100… BART  brd_co… basic csv   2017… 2020-12-23 14:17:36               NA
#>  4 DP1.100… BART  brd_co… basic csv   2018… 2020-12-23 14:17:21               NA
#>  5 DP1.100… BART  brd_co… basic csv   2019… 2020-12-23 14:17:45               NA
#>  6 DP1.100… BART  brd_co… basic csv   2020… 2020-12-23 14:17:03               NA
#>  7 DP1.100… BART  brd_co… basic csv   2020… 2020-12-23 14:17:41               NA
#>  8 DP1.100… BART  brd_pe… basic csv   2015… 2020-12-23 14:17:30               NA
#>  9 DP1.100… BART  brd_pe… basic csv   2016… 2020-12-23 14:17:14               NA
#> 10 DP1.100… BART  brd_pe… basic csv   2017… 2020-12-23 14:17:36               NA
#> # … with 844 more rows, and 7 more variables: verticalPosition <dbl>,
#> #   samplingInterval <chr>, date_range <chr>, path <chr>, md5 <chr>,
#> #   crc32 <chr>, release <chr>
```

These files will persist between sessions, so you only need to download
once or to retrieve updates. `neon_index()` can take arguments to filter
by product or pattern (regular expression) in table name,
e.g.`neon_index(table = "brd")`.

Once you determine the table of interest, you can read in all the
component tables into a single `data.frame`

``` r
neon_read("brd_countdata-expanded")
#> NULL
```

### Database backend

`neonstore` now supports a backend relation database as well. Import
data from the raw downloaded files using `neon_store()`:

``` r
neon_store(table = "brd_countdata-expanded")
#> table brd_countdata-expanded not found, do you need to download first?
```

Alternately, we could import all data tables associated with a given
product:

``` r
neon_store(product = "DP1.10003.001")
#>   importing brd_countdata-basic-DP1.10003.001...
#>   importing brd_perpoint-basic-DP1.10003.001...
```

Access an imported table using `neon_table()` instead of `neon_read()`:

``` r
neon_table("brd_countdata")
#> # A tibble: 203,220 x 23
#>    uid                namedLocation     domainID siteID plotID plotType  pointID
#>    <chr>              <chr>             <chr>    <chr>  <chr>  <chr>     <chr>  
#>  1 01cef6c1-5851-407… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  2 43990e9a-1412-427… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  3 d4f59f3c-e3f1-4a7… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  4 4ad44b7d-1eb6-465… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  5 944a3e0e-08de-497… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  6 d4cb0f22-923b-449… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… C1     
#>  7 0cc69b4f-650f-4f7… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… B1     
#>  8 c6367f2f-8b74-402… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… B1     
#>  9 406e8277-2c18-4b2… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… B1     
#> 10 ef879541-c8d5-41c… HEAL_006.birdGri… D19      HEAL   HEAL_… distribu… B1     
#> # … with 203,210 more rows, and 16 more variables: startDate <dttm>,
#> #   eventID <chr>, pointCountMinute <dbl>, targetTaxaPresent <chr>,
#> #   taxonID <chr>, scientificName <chr>, taxonRank <chr>, vernacularName <chr>,
#> #   observerDistance <dbl>, detectionMethod <chr>, visualConfirmation <chr>,
#> #   sexOrAge <chr>, clusterSize <dbl>, clusterCode <chr>, identifiedBy <chr>,
#> #   file <chr>
```

Access the remote database using `neon_db()`. This is a `DBIConnection`
that can easily be used with `dplyr` functions like `tbl()` or
`filter()`.  
Remember that `dplyr` translates these into SQL queries that run
directly on the database.

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
con <- neon_db()
brd <- tbl(con, "brd_countdata-basic-DP1.10003.001")
brd %>% filter(siteID == "ORNL")
#> # A tibble: 8,797 x 23
#>    uid                namedLocation     domainID siteID plotID plotType  pointID
#>    <chr>              <chr>             <chr>    <chr>  <chr>  <chr>     <chr>  
#>  1 33425600-9ce1-4a9… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  2 faf5ee98-43e9-40f… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  3 2dc63a4a-3da1-4e0… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  4 7952192b-55b4-48f… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  5 41bf843e-3433-4d0… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  6 e88d8ada-e43a-409… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  7 04604bac-dd88-4d1… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  8 05a8d535-3f59-413… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#>  9 b5cccafa-acbf-41e… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#> 10 63d9e30e-ab6c-41b… ORNL_002.birdGri… D07      ORNL   ORNL_… distribu… A1     
#> # … with 8,787 more rows, and 16 more variables: startDate <dttm>,
#> #   eventID <chr>, pointCountMinute <dbl>, targetTaxaPresent <chr>,
#> #   taxonID <chr>, scientificName <chr>, taxonRank <chr>, vernacularName <chr>,
#> #   observerDistance <dbl>, detectionMethod <chr>, visualConfirmation <chr>,
#> #   sexOrAge <chr>, clusterSize <dbl>, clusterCode <chr>, identifiedBy <chr>,
#> #   file <chr>
```

Note that we need to include the product name in the table name when
accessing the database, as table names alone may not be unique. RStudio
users can also list and explore all tables interactively in the
Connections pane in RStudio using `neon_pane()`.

### Note on API limits

If `neon_download()` exceeds the API request limit (with or without the
token), `neonstore` will simply pause for the required amount of time to
avoid rate-limit-based errors.

[The NEON API now rate-limits
requests.](https://data.neonscience.org/data-api/rate-limiting/#api-tokens).
Using a personal token will increase the number of requests you can make
before encountering this delay. See link for directions on registering
for a token. Then pass this token in `.token` argument of
`neon_download()`, or for frequent use, add this token as an
environmental variable, `NEON_DATA` to your local `.Renviron` file in
your user’s home directory. `neon_download()` must first query each the
API of each NEON site which collects that product, for each month the
product is collected.

(It would be much more efficient on the NEON server if the API could
take queries of the from `/data/<product>/<site>`, and pool the results,
rather than require each month of sampling separately\!)

### Non-stacking files and low-level interface

At it’s core, `neonstore` is simply a mechanism to download files from
the NEON API. While the `.csv` files from the Observation Systems (OS,
e.g. bird count surveys), and Instrument Systems (e.g. aquatic sensors)
are typically stacked into large tables, other products, such as the
`.laz` and `.tif` images produced by the airborne observation platform
LIDAR and cameras may require a different approach.

``` r
# Read in a large file list for illustration purposes
cper_data <- readr::read_csv("https://minio.thelio.carlboettiger.info/shared-data/neon_data_catalog.csv.gz")
#> Registered S3 methods overwritten by 'readr':
#>   method           from 
#>   format.col_spec  vroom
#>   print.col_spec   vroom
#>   print.collector  vroom
#>   print.date_names vroom
#>   print.locale     vroom
#>   str.col_spec     vroom
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   crc32 = col_character(),
#>   name = col_character(),
#>   size = col_double(),
#>   url = col_character()
#> )

## Typically one would read all files in local store, e.g. list.file(neon_dir())
df <- neon_filename_parser(cper_data$name)
```

``` r
library(dplyr)
df %>% count(EXT, sort=TRUE)
#> # A tibble: 13 x 2
#>    EXT       n
#>    <chr> <int>
#>  1 csv   38816
#>  2 <NA>   8938
#>  3 zip    4197
#>  4 tif    3994
#>  5 txt    3359
#>  6 xml    3316
#>  7 kml    1155
#>  8 dbf    1100
#>  9 prj    1100
#> 10 shp    1100
#> 11 shx    1100
#> 12 h5     1093
#> 13 laz     330
```

We can take a look at all `laz` LIDAR files:

``` r
df %>% 
  filter(EXT == "laz")
#> # A tibble: 330 x 31
#>    NEON  DOM   SITE  DPL   PRNUM REV   DESC  YYYY_MM PKGTYPE GENTIME EXT   name 
#>    <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>   <chr>   <chr>   <chr> <chr>
#>  1 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  2 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  3 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  4 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  5 NEON  D10   CPER  DP1   <NA>  <NA>  uncl… <NA>    <NA>    <NA>    laz   NEON…
#>  6 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  7 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  8 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#>  9 NEON  D10   CPER  DP1   <NA>  <NA>  clas… <NA>    <NA>    <NA>    laz   NEON…
#> 10 NEON  D10   CPER  DP1   <NA>  <NA>  uncl… <NA>    <NA>    <NA>    laz   NEON…
#> # … with 320 more rows, and 19 more variables: MISC <chr>, HOR <chr>,
#> #   VER <chr>, TMI <chr>, YYYY_MM_DD <chr>, DATE_RANGE <chr>, FLHTSTRT <chr>,
#> #   EHCCCCCC <chr>, IMAGEDATETIME <chr>, NNNN <chr>, NNN <chr>, R <chr>,
#> #   FLIGHTSTRT <chr>, EEEEEE <chr>, NNNNNNN <chr>, FLHTDATE <chr>,
#> #   FFFFFF <chr>, README <lgl>, COMPRESSION <lgl>
```

Note that many of the airborne observation platform (AOP) products, such
as these LIDAR files, do not include the PRNUM or REV components that make up part of the `productCode`s used in the NEON `product` tables.

## EFIstandards package

<!-- badges: start -->
  [![R build status](https://github.com/cboettig/forecast-standards/workflows/R-CMD-check/badge.svg)](https://github.com/cboettig/forecast-standards/actions) 
  [![CRAN status](https://www.r-pkg.org/badges/version/EFIstandards)](https://CRAN.R-project.org/package=EFIstandards)
  [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
  <!-- badges: end -->


This package summarizes the proposed community standards for the common formatting and archiving of ecological forecasts developed by the Ecological Forecasting Initiative (EFI). Such open standards are intended to promote interoperability and facilitate forecast adoption, distribution, validation, and synthesis. 

### Output Files:

EFI has proposed a three-tiered approach reflecting trade-offs in forecast data volume and technical expertise. The prefered output file format is in netCDF following standard CF conventions for dimensions and variable naming conventions, with ensemble member as a dimension where appropriate. The second-tier option is a semi-long CSV format, with state variables as columns and each row representing a unique issue datetime, prediction datetime, location, ensemble member, etc. The third-tier option is similar to option 2, but each row represents a specific summary statistic (mean, upper/lower CI) rather than individual ensemble members.

### Output Metadata:

EFI’s proposed metadata represents an expansion upon the Ecological Metadata Language (EML), with two key differences. First, is the specification of additonalMetadata tags to store forecast specific information (e.g. uncertainty propagation and data assimilation) as well as some summary information about model complexity, included uncertainties, etc. designed to facilitate cross-forecast synthesis. Second, a number of EML tags (e.g. temporal resolution, output variables) are considered a required part of forecast metadata that are otherwise optional in base EML.

This package includes an R tool for validating these EML files.

### Archiving:

EFI envisions a three-tiered approach to forecast archiving. At the most basic level, forecasts should be archived before new observations become available (not possible for hindcasts), preferably in a FAIR public archive that permits forecasts to be uploaded automatically, allows metadata to be searchable, and assigns a DOI. Second, in addition to this the codes used to generate forecasts should also be archived, preferably in an open archive or code repository (e.g. Github) that can be assigned a DOI. Finally, in addition to output and code archiving, we encourage running forecast workflows to be archived using virtualization approaches, such as Docker or Singularity containers.

### Vignettes:

This package includes a number of vignettes illustrating the application of the EFI standards to different forecasts

### Documentation:

A more detailed description of the EFI standard can be found at [https://shorturl.at/irMQW](https://shorturl.at/irMQW). Note that the Standard is a work in progress. If you find issues as you are applying them, let us know at eco4cast.initiative@gmail.com. 

Pkgdown rendered documentation of functions and vignettes can be found at https://eco4cast.github.io/EFIstandards/
