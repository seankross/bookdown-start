# Theme: Aquatic Ecosystems

**What:** Freshwater surface water temperature and water quality

**Where:** 2 lakes and 3 river/stream NEON sites. 

**When:**  Forecasts produced daily with a 35-day forecast horizon. Forecast submissions are accepted daily throughout 2022.  The only requirement is that submissions are predictions of the future at the time the forecast is submitted.

**Why:** Freshwater surface water temperature, dissolved oxygen, and chlorophyll-a are critical for life in aquatic environments and can represent the health of the system

**Who:** Open to any individual or team that registers

**How:** [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast. If you registered for the Round 1 (2021) and are using the same team and method then you do not need to re-register.


The video below is an overview of the Aquatic Ecosystems Challenge that was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/935Uiy11mTw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We held a Q&A session on May 21, 2021. You can find a recording from that session  [HERE](https://youtu.be/KBAPZoDKbk8){target="_blank"}.




## Overview

In streams and rivers, forecasting water temperature can be meaningful for protecting aquatic communities while maintaining socio-economic benefits (Ouellet-Proulx et al. 2017). In lentic systems, successfully forecasting surface water temperatures can be important for fisheries and water utilities that need to manage the outflowing temperatures (Zhu et al. 2020). Recently, water temperature forecasts in lakes have been used to predict seasonal turnover when nutrients from the bottom can be mixed to the surface and impair the water quality. 

Dissolved oxygen concentration is a critically important variable in limnology. Forecasts of dissolved oxygen in freshwaters is the first step to understanding other freshwater ecosystem processes. For example, oxygen serves as the gatekeeper to other biogeochemical reactions that occur in rivers and lakes. Preemptive forecasts of dissolved oxygen concentrations can anticipate periods of high or low oxygen availability, thereby providing insight into how the ecosystem may change at relatively short timescales. 

chlorophyll-a is a metric of phytoplankton biomass. Phytoplankton biomass are the base of the aquatic food-web and an important indicator of water quality for managers.

## Challenge

This design challenge asks teams to produce forecasts of mean daily surface water temperature, dissolved oxygen, and/or chlorophyll-a in 2 NEON lake and/or 3 NEON river/stream sites for 35-days in the future.  

You can chose to submit to either the lakes or the streams or both.  You can also chose to submit any of the three focal variables (temperature, oxygen, and chlorophyll).

Teams are asked to submit their 35-day forecasts of NEON surface mean daily surface water temperature, dissolved oxygen, and/or chlorophyll-a along with uncertainty estimates and metadata. NEON surface water temperature, dissolved oxygen, and chlorophyll-a collected prior to the current date will be provided and may be used to build and improve the forecast models. Other data can be used as long as teams provide access (minimum of URL, but ideally a script) to all teams in the challenge.

## Data: Targets

The R script for generating the evaluation and training data (i.e., targets) can be found at: https://github.com/eco4cast/neon4cast-aquatics

The challenge uses the following NEON data products:
- [DP1.20264.001](https://data.neonscience.org/data-products/DP1.20264.001){target="_blank"}: Temperature at specific depth in surface water
- [DP1.20288.001](https://data.neonscience.org/data-products/DP1.20288.001){target="_blank"}: Water quality (includes oxygen and chlorophyll-a)   

A file with previously released NEON data that has been processed into targets is provided below. The target script can be found [here](https://github.com/eco4cast/neon4cast-aquatics/blob/master/02_generate_targets_aquatics.R){target="_blank"}. The same processing will be applied to new data that are used for forecast evaluation. 

Here is the format of the target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/aquatics/aquatics-targets.csv.gz")
```

```
## # A tibble: 9,623 × 10
##    time       siteID oxygen temperature  chla oxygen_sd temperature_sd chla_sd
##    <date>     <chr>   <dbl>       <dbl> <dbl>     <dbl>          <dbl>   <dbl>
##  1 2017-08-27 BARC       NA        31.4    NA        NA        0.00162      NA
##  2 2017-08-27 BARC       NA        31.5    NA        NA        0.00121      NA
##  3 2017-08-28 BARC       NA        31.1    NA        NA        0.00155      NA
##  4 2017-08-28 BARC       NA        31.1    NA        NA        0.00117      NA
##  5 2017-08-29 BARC       NA        31.2    NA        NA        0.00211      NA
##  6 2017-08-29 BARC       NA        31.1    NA        NA        0.00168      NA
##  7 2017-08-30 BARC       NA        31.5    NA        NA        0.00208      NA
##  8 2017-08-30 BARC       NA        31.4    NA        NA        0.00210      NA
##  9 2017-08-31 BARC       NA        31.7    NA        NA        0.00193      NA
## 10 2017-08-31 BARC       NA        31.7    NA        NA        0.00176      NA
## # … with 9,613 more rows, and 2 more variables: depth_oxygen <dbl>,
## #   depth_temperature <dbl>
```

The target file has the following columns   

- `time`: date of observation    
- `siteID`: NEON site code    
- `oxygen`: oxygen (mg/L)   
- `temperature`: temperature (Celsius)   
- `chla`: chlorophyll-a (mg/L)
- `oxygen_sd`: standard deviation of oxygen observation as reported by NEON    
- `temperature_sd`: standard deviation of temperature observation as reported by NEON   
- `chla_sd`: standard deviation of temperature observation as reported by NEON   
- `depth_oxygen`: depth in meters of oxygen and chlorophyll observation   
- `depth_temperature`: depth in meters of temperature observation

### Surface Mean Daily Dissolved Oxygen Concentration

**Definition**

Dissolved oxygen (DO) is the concentration of oxygen dissolved in water. NEON’s 30-minute time resolution from deployed water quality sondes among the freshwater sites reports this concentration as mg L<sup>-1</sup>. We have adapted the available NEON DO data to output the mean daily DO concentration in mg L<sup>-1</sup> from a water quality sonde deployed 1m below the water surface at a lake site (BARC and CRAM) and a water quality sonde deployed in a stream site (COMO, MCDI, POSE). Common DO concentrations range between 0 and 12 mg L<sup>-1</sup> and DO concentrations less than 2 mg L<sup>-1</sup> are considered hypoxic. 

**Motivation**

Dissolved oxygen concentration is a critically important variable in limnology. Forecasts of dissolved oxygen in freshwaters is the first step to understanding other freshwater ecosystem processes. For example, oxygen serves as the gatekeeper to other biogeochemical reactions that occur as well as determine the variety and health of aquatic organisms present in rivers and lakes. Preemptive forecasts of dissolved oxygen concentrations can anticipate periods of high or low oxygen availability, thereby providing insight into how the ecosystem may change at relatively short timescales. 

### Surface Mean Daily Water Temperature

**Definition**

Water temperature is the temperature of the water. NEON’s 30-minute time resolution from deployed water temperature sondes in the freshwater sites reports this in degrees Celsius (°C). We have adapted the available NEON water temperature data to output the mean daily water temperature in °C from temperature thermisters deployed 0-1m below the water surface at the lake sites (BARC and CRAM) and a water temperature sonde deployed in a stream site (COMO, MCDI, POSE). Common water temperatures in lakes and streams range between 4 and 35 °C.

**Motivation**

In streams and rivers, forecasting water temperature can be meaningful for protecting aquatic communities while maintaining socio-economic benefits (Ouellet-Proulx et al. 2017). In lentic and lotic systems, successfully forecasting water temperatures can be important for management of fisheries and water utilities that rely on specific threshold  temperatures (Zhu et al. 2020). Recently, lake temperature forecasts have been used to predict seasonal turnover, mixing bottom nutrients into the surface and impairing water quality.

### Chlorophyll-a

**Definition**

chlorophyll-a (chla) is the concentration of chlorophyll-a in the water column, as measured using florescence. NEON’s 30-minute time resolution from deployed water quality sondes among the freshwater sites reports this concentration as mg L<sup>-1</sup>. We have adapted the available NEON chla data to output the mean daily chla concentration in mg L<sup>-1</sup> from a water quality sonde deployed ~-0.3 - 1m below the water surface at a lake site (BARC and CRAM) and a water quality sonde deployed in a stream site (COMO, MCDI, POSE).

**Motivation**

Phytoplankton biomass are the base of the aquatic food-web and an important indicator of water quality for managers.

### Focal sites

Information on the sites can be found here:


```r
site_data <- readr::read_csv("https://raw.githubusercontent.com/eco4cast/neon4cast-aquatics/master/Aquatic_NEON_Field_Site_Metadata_20210928.csv")
```


|siteID |site name            |waterbody type  | latitude| longtitude|NEON site URL                                |
|:------|:--------------------|:---------------|--------:|----------:|:--------------------------------------------|
|BARC   |Lake Barco NEON      |Lake            | 29.67598|  -82.00841|https://www.neonscience.org/field-sites/barc |
|COMO   |Como Creek NEON      |Wadeable Stream | 40.03496| -105.54416|https://www.neonscience.org/field-sites/como |
|CRAM   |Crampton Lake NEON   |Lake            | 46.20967|  -89.47369|https://www.neonscience.org/field-sites/cram |
|MCDI   |McDiffett Creek NEON |Wadeable Stream | 38.94586|  -96.44302|https://www.neonscience.org/field-sites/mcdi |
|POSE   |Posey Creek NEON     |Wadeable Stream | 38.89431|  -78.14726|https://www.neonscience.org/field-sites/pose |

## Timeline

Forecasts for a minimum of 35 days can be submitted daily by 11:59 pm UTC throughout 2022. A minimum of 35 days in the future must be forecasted for each submission. For example, a forecast submitted on February 1 should be for at least February 1st – March 7th. New forecasts can be submitted daily as new weather forecasts and observations (e.g., new flux data is released by NEON) become available. The key is that submissions are predictions of the future.

Even that daily submissions are allowed and encouraged as new observations and weather forecasts become available, the automation of forecast generation may be ideal.  There are many ways to automate scripts that are written to download observations and meteorology drivers, generate forecasts, and submit forecasts. Two tools that many have used are cron jobs (see the R package [cronR](https://cran.r-project.org/web/packages/cronR/index.html){target="_blank"}) that execute tasks at user specified times and [github actions](https://youtu.be/dMrUlXi4_Bo){target="_blank"}.  See more at [Frequently Asked Questions]    

Cron jobs work on unix and mac systems.  An example of a script that executes a cron job using R can be found [here](https://github.com/eco4cast/neon4cast-aquatics/blob/master/cron_automation.R){target="_blank"}.

## Observed data latency

NEON data officially releases the temperature, oxygen, and chlorophyll-a data on their data portal and API in monthly data packages.  Data for a given month is scheduled to be released around the 15th of the following month. As a result there will be a gap of 2 weeks - 6 weeks between the last available observation and the start of your forecast.  

## Submissions

Instructions for submitting forecasts are found here: [Submission Instructions]

The specific file format for the aquatics theme is here: [Aquatics]

## Meterological inputs for modeling

Information about forecasted meteorology that is available for you to use when generating your forecasts can be found here: [Meteorology Inputs] 

## Useful functions

Functions for validating, evaluating and submitting forecasts can be found here: [Helpful Functions]

Functions for downloading and working with the meteorology forecasts can be be found here: [Access EFI snapshots of NOAA forecasts at NEON sites]

## Null models

A climatology null model is automatically generated each day to served as a simple baseline model. This climatology null model forecasts that the nee or lee will be equal to the historical mean of that day of year.

Code for the climatology null model can be found [here](https://github.com/eco4cast/neon4cast-aquatics/blob/master/03_climatology_null.R){target="_blank"}

## FAQ

Answers to frequency asks questions can be found here: [Frequently Asked Questions]

## Design Team

James Guinnip, Kansas State University  
Sarah Burnet, University of Idaho  
Ryan McClure, Virginia Tech  
Chris Brown, National Oceanic and Atmospheric Administration  
Cayelan Carey, Virginia Tech  
Whitney Woelmer, Virginia Tech   
Jake Zwart, United States Geological Survey  

## Partners

The challenge is hosted by the Ecological Forecasting Initiative (EFI; https://ecoforecast.org/) and its U.S. National Science Foundation sponsored Research Coordination Network (EFI-RCN; https://ecoforecast.org/rcn/).

Data used in the challenge are from the National Ecological Observatory Network (NEON): https://www.neonscience.org/. 

Scientists from NOAA and USGS have been involved in the design of the challenge.

## References

Ouellet-Proulx, S., St-Hilaire, A., and Bouchar, M.-A.. 2017. Water temperature ensemble forecasts: Implementation using the CEQUEAU model on two contrasted river systems. Water 9(7):457. https://doi.org/10.3390/w9070457

Zhu, S., Ptak, M., Yaseen, Z.M., Dai, J. and Sivakumar, B. 2020. Forecasting surface water temperature in lakes: a comparison of approaches. Journal of Hydrology 585, 124809. https://doi.org/10.1016/j.jhydrol.2020.124809
