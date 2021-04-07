# Theme: Tick Populations

**What:** *Amblyomma americanum* and *Ixodes scapularis* nymphal tick abundance per sampled area

**Where:** 22 plots at 7 NEON sites 

**When:** Weekly forecasts for 34 weeks into the future starting March 31-October 31, 2021 with training data available January 31, 2021. Forecasts are submitted monthly and later submissions after the March 31 start are permissible.

**Why:** There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

**Who**: Open to any individual or team that registers

**How**: [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast

We held a Q&A session on March 24, 2021. You can find a recording from that session [HERE](https://youtu.be/kyR0MoDCO1Q){target="_blank"}.

## Overview

Target species for the population forecasts are *Amblyomma americanum* and *Ixodes scapularis* nymphal ticks. *A. americanum* is a vector of ehrlichiosis, tularemia, and southern tick-associated rash illness, while *I. scapularis* is a vector for Lyme disease, the most prevalent tick-borne disease in North America. Both species are present in the eastern United States, and have been collected at numerous NEON sites. There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

## Challenge 

The challenge is open to any individual, group, or institution that may want to participate. The goals of this challenge are to forecast total *Ixodes scapularis* and *Amblyomma americanum* nymphs each epidemiological week (Sun-Sat) per sampled area at a set of NEON plots within NEON sites. Due to challenges in data collected in 2020, this round of the forecasting challenge will simulate a true forecasting challenge by focusing on data from the 2019 field season.

Teams must post information about any additional data they wish to use on the theme Slack channel so that other teams can potentially use the data as well.

## Data: Targets

The challenge uses the following NEON data products:

[DP1.10093.001](https://data.neonscience.org/data-products/DP1.10093.001){target="_blank"}: Ticks sampled using drag cloths

Total *Ixodes scapularis* will be forecasting for the following plots (siteID_plotID): 

BLAN_012, BLAN_005, SCBI_013, SCBI_002, SERC_001, SERC_005, SERC_006, SERC_012, ORNL_007

Total *Amblyomma americanum* will be forecasting for the following plots (siteID_plotID): 

SCBI_013, SERC_001, SERC_005, SERC_006, SERC_002, SERC_012, KONZ_025, UKFS_001, UKFS_004, UKFS_003, ORNL_002, ORNL_040, ORNL_008, ORNL_007, ORNL_009, ORNL_003, TALL_001, TALL_008, TALL_002

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation.  This [processing script](https://github.com/eco4cast/neon4cast-ticks/blob/master/02_ticks_targets.R){target="_blank"} is available in the [neon4cast-ticks](https://github.com/eco4cast/neon4cast-ticks){target="_blank"} GitHub repository.

### Amblyomma americanum nymphs

**Definition**

Total *Amblyomma americanum* nymphs per week per plot.  Determined by the number of individuals caught and identified to species each epidemiological week at each plot. Each tick caught is identified to the lowest taxonomic level possible, and we are only interested in nymphal ticks identified to species (instead of only being identified to Family, Order, Genus etc.)

**Motivation**

This species is a vector of disease, so forecasting tick abundance can potentially aid in assessing disease risk. 

### Ixodes scapularis nymphs

**Definition**

Total *Ixodes scapularis* nymphs per week per plot. Determined by the number of individuals caught and identified to species each epidemiological week at each plot. Each tick caught is identified to the lowest taxonomic level possible, and we are only interested in nymphal ticks identified to species (instead of only being identified to Family, Order, Genus etc.)

**Motivation**

This species is a vector of disease, so forecasting tick abundance can potentially aid in assessing disease risk. 

### Focal sites

| Site Name       | SiteID     | NEON Domain     | Latitude  |  Longitude | Ixodes scapularis Plots | Amblyomma americanum Plots |
| :------------- | :----------: | -----------: | -----------: | -----------: | -----------: | -----------: |
|  [Blandy Experimental Farm, VA](https://www.neonscience.org/field-sites/blan){target="_blank"} | BLAN  | D02: Mid-Atlantic    | 39.06026 | -78.07164 | BLAN_012, BLAN_005 |   |
|  [Smithsonian Conservation Biology Institute, VA](https://www.neonscience.org/field-sites/scbi){target="_blank"} | SCBI  | D02: Mid-Atlantic    | 38.89292 | -78.1395 | SCBI_013, SCBI_002 | SCBI_013 |
|  [Smithsonian Environmental Research Center, MD](https://www.neonscience.org/field-sites/srer){target="_blank"}  | SRER  | D02: Mid-Atlantic    | 38.89008 | -76.56001 | SERC_001, SERC_005, SERC_006, SERC_012 | SERC_001, SERC_002, SERC_005, SERC_006 SERC_012|
|  [Oak Ridge, TN](https://www.neonscience.org/field-sites/blan){target="_blank"} | ORNL  | D07: Appalachians & Cumberland Plateau    | 35.96412 | -84.2826 | ORNL_007 | ORNL_002, ORNL_003, ORNL_007, ORNL_008, ORNL_009, ORNL_040 |
|  [Konza Prairie Biological Station, KS](https://www.neonscience.org/field-sites/konz){target="_blank"} | KONZ  | D06: Prairie Peninsula    | 39.10077 | -96.56309 |  | KONZ_025 |
|  [The University of Kansas Field Station, KS](https://www.neonscience.org/field-sites/ukfs){target="_blank"}  | UKFS  | D06: Prairie Peninsula    | 39.04043 | -95.19215 |  | UKFS_001, UKFS_003, UKFS_004 |
|  [Talladega National Forest, AL](https://www.neonscience.org/field-sites/tall){target="_blank"}  | TALL  | DO8: Ozarks Complex    | 32.95046 | -87.39327 |  | TALL_001, TALL_002, TALL_008 |



### Target data calculation

The data used for this challenge is a subset of the full NEON tick data set. While ticks of multiple species have been identified at most NEON sites, not all species-by-site combinations have enough non-zero observations to build adequate population models. Therefore, the targets for this challenge are *A. americanum* and *I. scapularis* nymphs, which represent the two most abundant species observed at NEON. Additionally, the plots that forecasts will be made are plots where these ticks have been identified at least three times each year from 2016 to 2018. The latency for taxonomic identifications of the NEON tick field data is roughly one year (meaning forecast for 2021 won’t be validated until 2022), and the 2020 field season was irregular due to the COVID-19 pandemic. Therefore, the target year of 2019 was chosen so that forecasts can be evaluated in a timely manner for a regular field season. 

**Use of 2019 data:** The forecasting challenge is for the 2019 field season, thus tick observations and environmental covariates are known. However, in the spirit of keeping this as much of a “forecasting” challenge as possible, 2019 data (tick and environmental covariates) can only be used in the timeline described below in the timeline section. For example, if a forecast is submitted on May 31st, and a team is using temperature as a covariate in their model, it is up to the team to forecast temperature from May 31st through the end of the season. This policy is in place because if forecasts use the observed temperature from May 31 through the end of the season in their forecast, these forecasts will be overconfident. 

### Target file

Here is the format of the target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/ticks/ticks-targets.csv.gz", guess_max = 1e6)
```

```
## # A tibble: 2,501 x 21
##     Year epiWeek yearWeek plotID   siteID nlcdClass       decimalLatitude
##    <dbl>   <dbl>    <dbl> <chr>    <chr>  <chr>                     <dbl>
##  1  2015      37   201537 BLAN_005 BLAN   deciduousForest            39.1
##  2  2015      38   201538 BLAN_005 BLAN   deciduousForest            39.1
##  3  2015      39   201539 BLAN_005 BLAN   deciduousForest            39.1
##  4  2015      40   201540 BLAN_005 BLAN   deciduousForest            39.1
##  5  2015      41   201541 BLAN_005 BLAN   deciduousForest            39.1
##  6  2015      42   201542 BLAN_005 BLAN   deciduousForest            39.1
##  7  2015      43   201543 BLAN_005 BLAN   deciduousForest            39.1
##  8  2015      44   201544 BLAN_005 BLAN   deciduousForest            39.1
##  9  2015      45   201545 BLAN_005 BLAN   deciduousForest            39.1
## 10  2015      46   201546 BLAN_005 BLAN   deciduousForest            39.1
## # … with 2,491 more rows, and 14 more variables: decimalLongitude <dbl>,
## #   elevation <dbl>, totalSampledArea <dbl>, amblyomma_americanum <dbl>,
## #   ixodes_scapularis <dbl>, time <date>, RHMin_precent <dbl>,
## #   RHMin_variance <dbl>, RHMax_precent <dbl>, RHMax_variance <dbl>,
## #   airTempMin_degC <dbl>, airTempMin_variance <dbl>, airTempMax_degC <dbl>,
## #   airTempMax_variance <dbl>
```


- `Year`: Year of observation
- `epiWeek`: The ISO week that starts on Sunday, consistent with CDC version of the epidemiological week (integer, WW)
- `yearWeek`: (YYYYWW) Year week, combination of year and epidemiological week
_ `time`: (YYYY-MM-DD), the first day of the epidemiological week, as defined by `MMWRweek::MMWRweek2Date(Year, epiWeek)`
- `ixodes_scapularis`: Count. If no observation in the associated yearWeek: NA
- `amblyomma_americanum`:  Count. If no observation in the associated yearWeek: NA
- `plotID`: Plot where ticks are observed (HARV_002)
- `siteID`: Site where ticks are observed (HARV)
- `nlcdClass`: Land cover classification (mixedForest)
- `decimalLatitude`: Latitude of the site
- `decimalLongitude`: Longitude of the site
- `Elevation`: Elevation of the plot (meters)
- `totalSampledArea`: Area sampled by drag cloth (sq. m). If there is not a sampling event in given week: NA
- `RHMin_percent`: The minimum relative humidity percent recorded in the associated yearWeek. If no observation: NA
- `RHMin_variance`: Variance (percent squared) of the minimum relative humidity recorded in the associated yearWeek. If no observation: NA
- `RHMax_percent`: The maximum relative humidity percent recorded in the associated yearWeek. If no observation: NA
- `RHMax_variance`: Variance (percent squared) of the maximum relative humidity recorded in the associated yearWeek. If no observation: NA
- `airTempMin_degC`: The minimum air temperature, in degrees celsius, recorded in the associated yearWeek. If no observation: NA
- `airTempMin_variance`: Variance (degrees celsius squared) of the minimum air temperature recorded in the associated yearWeek. If no observation: NA
- `airTempMax_degC`: The maximum air temperature, in degrees Celsius, recorded in the associated yearWeek. If no observation: NA
- `airTempMax_variance`: Variance (degrees celsius squared) of the maximum air temperature recorded in the associated yearWeek. If no observation: NA

Environmental data (weekly relative humidity and air temperature) in the challenge data set are provided as a starting point for teams that may not want to look for other environmental data. The challenge design team does not recommend one of these variables over another (from NEON or otherwise) or guarantee that their use will improve forecast accuracy. Furthermore, the environmental data provided is only available for the core terrestrial sites (KONZ, ORNL, SCBI, TALL), and is from NEON's Summary weather statistics data product [DP4.00001.001](https://data.neonscience.org/data-products/DP4.00001.001).

## Timeline

The timeline for this challenge will be monthly, which is how often new data will be released by the EFI RCN. 

The final data set containing the training data will be available no later than January 31st, 2021. The challenge will begin (first forecast submission) on March 31st, 2021 at 11:59 PM Eastern Standard Time, and will run through October 31st, 2021 (last forecast submission). 

2019 data will be released on the first of the month following a submission deadline, which gives teams a month to assimilate new data. For example, the forecasts submitted on March 31st, 2021 will be for every epidemiological week starting at the beginning of March 2019 through the end of November 2019. Then, on April 1st, 2021, tick counts from March 2019 will be released. The next forecast submission is April 30th, 2021, which will be for every epidemiological week starting at the beginning of April 2019 through the end of November 2019. The table below shows which epidemiological weeks are to be forecasted for each submission date.

|2021 Forecast Submission date|	2019 Target Epidemiological weeks |
| :------------- | :----------: | 
|March 31	|10-44|
|April 30	|14-44|
|May 31	|19-44|
|June 30	|23-44|
|July 31	|28-44|
August 31	|32-44|
|September 31	|36-44|
|October 31	|41-44|

Evaluation will occur shortly after each forecast submission. 

## Design team

John Foster, Boston University  
Matt Bitters, University of Colorado, Boulder  
Melissa Chen, University of Colorado, Boulder  
Leah Johnson, Virginia Tech  
Shannon LaDeau, Cary Institute of Ecosystem Studies  
Cat Lippi, University of Florida  
Brett Melbourne, University of Colorado, Boulder  
Wynne Moss, University of Colorado, Boulder  
Sadie Ryan, University of Florida  

## Partners

Data used in the challenge are collected by the National Ecological Observatory Network (NEON; https://www.neonscience.org/).
