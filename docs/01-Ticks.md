# Theme: Tick Populations

**What:** *Amblyomma americanum* nymphal tick abundance per sampled area

**Where:** 9 NEON sites 

**When:** Weekly forecasts for 4 weeks into the future starting March 31-September 30, 2022. Forecasts are submitted monthly and later submissions after the March 31 start are permissible.

**Why:** There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

**Who**: Open to any individual or team that registers

**How**: [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast. If you registered for the Round 1 (2021) and are using the same team and method then you do not need to re-register.

The video below is an overview of the Tick Populations Challenge that was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/lHH_nY52ZMM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We held a Q&A session on March 24, 2021. You can find a recording from that session [HERE](https://youtu.be/kyR0MoDCO1Q){target="_blank"}.



## Overview

Target species for the population forecasts are *Amblyomma americanum* nymphal ticks. *A. americanum* is a vector of ehrlichiosis, tularemia, and southern tick-associated rash illness. The species is present in the eastern United States, and their populations are expanding. There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

## Challenge 

The challenge is open to any individual, group, or institution that may want to participate. The goals of this challenge are to forecast the density of *Amblyomma americanum* nymphs (ticks/1600m^2) each epidemiological week (Sun-Sat) at nine NEON sites. Due to the latency in the taxonomic data reported by NEON, the challenge will be for the 2021 field season.

Teams must post information about any additional data they wish to use on the theme Slack channel so that other teams can potentially use the data as well.

## Data: Targets

The challenge uses the following NEON data products:

[DP1.10093.001](https://data.neonscience.org/data-products/DP1.10093.001){target="_blank"}: Ticks sampled using drag cloths

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation.  This [processing script](https://github.com/eco4cast/neon4cast-ticks/blob/master/02_ticks_targets.R){target="_blank"} is available in the [neon4cast-ticks](https://github.com/eco4cast/neon4cast-ticks){target="_blank"} GitHub repository.

### Amblyomma americanum nymphs

**Definition**

The density of *Amblyomma americanum* nymphs per week. Density is defined as the total number of individuals caught in a week across the forested plots divided by the total area sampled in the forested plots during the week. Densities are presented as ticks per 1600m^2, as 1600m^2 is the size of an individual NEON tick plot.

**Motivation**

We chose to use the density of *Amblyomma americanum* nymphs for several reasons. The first is that *Amblyomma americanum* is a vector of multiple pathogens, many of which cause human disease, and a forecast for their abundance could aid decisions in public health and personal protective measures. For simplicity, we chose to focus on one species for the abundance challenge, and the *Amblyomma americanum* nymphs are the most abundant tick observed in the NEON data. Most ticks are observed in to forested plots, and by standardizing the data to density of ticks observed per unit effort in the forested plots, we hope to avoid forecasters predicting sampling effort. We scaled the density to be representative of ticks per plot, which is more interpretable than ticks per square meter. Also, tick drags occur every three weeks. By having the challenge be for forecasting every week, participants won't have to predict which weeks drags occur.

### Focal sites

Information on the sites can be found here:


```r
site_data <- readr::read_csv("https://raw.githubusercontent.com/eco4cast/neon4cast-ticks/master/Ticks_NEON_Field_Site_Metadata_20210928.csv")
```


|siteID |site name                                       |vegetation type                                                        | latitude| longtitude|NEON site URL                                |
|:------|:-----------------------------------------------|:----------------------------------------------------------------------|--------:|----------:|:--------------------------------------------|
|BLAN   |Blandy Experimental Farm NEON                   |Deciduous Forest&#124;Pasture/Hay                                      | 39.03370|  -78.04179|https://www.neonscience.org/field-sites/blan |
|KONZ   |Konza Prairie Biological Station NEON           |Deciduous Forest&#124;Grassland/Herbaceous                             | 39.10077|  -96.56307|https://www.neonscience.org/field-sites/konz |
|LENO   |Lenoir Landing NEON                             |Deciduous Forest&#124;Woody Wetlands                                   | 31.85386|  -88.16118|https://www.neonscience.org/field-sites/leno |
|ORNL   |Oak Ridge NEON                                  |Deciduous Forest&#124;Evergreen Forest&#124;Pasture/Hay                | 35.96413|  -84.28259|https://www.neonscience.org/field-sites/ornl |
|OSBS   |Ordway-Swisher Biological Station NEON          |Emergent Herbaceous Wetlands&#124;Evergreen Forest&#124;Woody Wetlands | 29.68928|  -81.99343|https://www.neonscience.org/field-sites/osbs |
|SCBI   |Smithsonian Conservation Biology Institute NEON |Deciduous Forest&#124;Evergreen Forest&#124;Pasture/Hay                | 38.89292|  -78.13949|https://www.neonscience.org/field-sites/scbi |
|SERC   |Smithsonian Environmental Research Center NEON  |Cultivated Crops&#124;Deciduous Forest                                 | 38.89013|  -76.56001|https://www.neonscience.org/field-sites/serc |
|TALL   |Talladega National Forest NEON                  |Deciduous Forest&#124;Evergreen Forest&#124;Mixed Forest               | 32.95047|  -87.39326|https://www.neonscience.org/field-sites/tall |
|UKFS   |University of Kansas Field Station NEON         |Deciduous Forest&#124;Pasture/Hay                                      | 39.04043|  -95.19215|https://www.neonscience.org/field-sites/ukfs |

### Target data calculation

Tick drags occur every three weeks at the NEON sites used in this challenge. The sampling season at each site is determined by phenological milestones, beginning and ending within two weeks of green-up and senescence, respectively. The 1m^2 cloth is dragged for 160m (and at least 80m), and ticks are collected intermittently. They are then sent to a lab for taxonomic identification. Ticks are then identified by life stage and taxonomic rank. The target data is for *Amblyomma americanum* nymphs that were identified to the species level; i.e. ticks identified as being in the *Amblyomma* genus are not included. 

**Use of 2021 data:** The forecasting challenge is for the 2021 field season, thus environmental covariates are known. However, in the spirit of keeping this as much of a “forecasting” challenge as possible, we ask that for four week forecast period teams use the NOAA GEFS forecasting data. 

### Target file

Here is the format of the target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/ticks/ticks-targets.csv.gz", guess_max = 1e6)
```

```
## # A tibble: 3,024 × 21
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
## # … with 3,014 more rows, and 14 more variables: decimalLongitude <dbl>,
## #   elevation <dbl>, totalSampledArea <dbl>, amblyomma_americanum <lgl>,
## #   ixodes_scapularis <lgl>, time <date>, RHMin_precent <lgl>,
## #   RHMin_variance <lgl>, RHMax_precent <lgl>, RHMax_variance <lgl>,
## #   airTempMin_degC <lgl>, airTempMin_variance <lgl>, airTempMax_degC <lgl>,
## #   airTempMax_variance <lgl>
```


- `time`: YYYY-MM-DD The first day (Sunday) of the MMWR week
- `mmwrWeek`: The MMWR week that starts on Sunday, consistent with CDC version of the epidemiological week  
- `siteID`: Site where ticks are observed (HARV)
- `Amblyomma americanum`:  Density (ticks / 1600m^2) of *Amblyomma americanum* ticks

## Timeline

The challenge will begin on March 31, 2022 at 11:59 PM Eastern Standard Time, and will run through October 31, 2022. Each forecast will be for the four MMWR weeks during that month.

For example, the forecast that is due on March 31, 2022 will be for MMWR weeks 10-13 of 2021 because the Sundays (the start of each MMWR week) in March 2021 correspond to MMWR weeks 10-13. Likewise, the forecast due April 30, 2022 will be for MMWR weeks 14-17 of 2021. A table of which weeks to forecast at each deadline can be found below.

It is unclear when the provisional 2021 tick taxonomic data will be released. If any is released during the challenge, teams will be able to use it if the data is for weeks that have already been forecasted. For example, if the provisional 2021 data is released on July 15, 2022, teams can use the 2021 data up to MMWR week 26 to calibrate their models for the forecasts due July 31, 2022. 

|2022 Forecast Submission date | 2021 Target Epidemiological weeks |
| :------------- | :----------: | 
|March 31	|10-13|
|April 30	|14-17|
|May 31	|18-22|
|June 30	|23-26|
|July 31	|27-30|
August 31	|31-35|
|September 31	|36-39|
|October 31	|40-44|

## Submissions

Instructions for submitting forecasts are found here: [Submission Instructions]

With the specific file format here: [Ticks]

## Meterological inputs for modeling

Information about forecasted meteorology that is available for you to use when generating your forecasts can be found here: [Meteorology Inputs] 

## Useful functions

Functions for validating, evaluating and submitting forecasts can be found here: [Helpful Functions]

Functions for downloading and working with the meteorology forecasts can be be found here: [Access EFI snapshots of NOAA forecasts at NEON sites]

## Null models

Pending

## FAQ

Answers to frequency asks questions can be found here: [Frequently Asked Questions]

## Design team

Matt Bitters, University of Colorado, Boulder  
Melissa Chen, University of Colorado, Boulder  
John Foster, Boston University  
Leah Johnson, Virginia Tech  
Shannon LaDeau, Cary Institute of Ecosystem Studies  
Cat Lippi, University of Florida  
Brett Melbourne, University of Colorado, Boulder  
Wynne Moss, University of Colorado, Boulder  
Sadie Ryan, University of Florida  

## Partners

Data used in the challenge are collected by the National Ecological Observatory Network (NEON; https://www.neonscience.org/).
