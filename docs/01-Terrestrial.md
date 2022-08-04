# Theme: Carbon and Water Fluxes

**What:** Net ecosystem exchange of CO2 and evapotranspiration in terrestrial ecosystems

**Where**: 10 NEON sites across the conterminous U.S.

**When**: Daily forecasts for 35-days in the future. Forecast submissions are accepted daily throughout 2022.  The only requirement is that submissions are predictions of the future at the time the forecast is submitted.

**Why:** Carbon and water cycling are fundamental for climate and water regulation services provided by ecosystems

**Who**: Open to any individual or team that registers

**How**: [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast. If you registered for the Round 1 (2021) and are using the same team and method then you do not need to re-register.

The video below is an overview of the Terrestrial Carbon and Water Fluxes Challenge that was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/WmFsACm-TMk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We held a Q&A session on January 22, 2021. You can find a recording from that session [HERE](https://www.youtube.com/watch?v=3rOVlAX9YH8&feature=youtu.be){target="_blank"}.



## Overview

The exchange of water and carbon dioxide between the atmosphere and the land is akin to earth’s terrestrial ecosystems breathing rate and lung capacity. One of the best ways to monitor changes in the amount of carbon and water in an ecosystem is the eddy-covariance method. This method observes the net amount of carbon and water entering and exiting ecosystems at half-hourly timesteps, which is important because it can provide information on ecosystem processes such as photosynthesis, respiration, and transpiration, their sensitivities to ongoing climate and land use change, and greenhouse gas budgets for carbon accounting and natural climate solutions. Forecasts of carbon uptake and release along with water use can provide insights into future production of food, fiber, timber, and carbon credits. Additionally, forecasts will highlight the influence that stress and disturbance have on carbon and water cycling.

## Challenge 

This forecasting challenge asks teams to forecast net ecosystem exchange of carbon dioxide (NEE) and latent heat flux of evapotranspiration (LE) across 10 NEON sites with differing climates. Forecasts can be submitted the 30-minute and/or daily time step over the next 35-days. Weather forecasts from NOAA Global Ensemble Forecast System are provided to use as model drivers (if forecasting model uses meteorological inputs). Forecasts can be submitted each day in 2022. 

Teams are asked to submit their forecast of measured NEON NEE and LE, along with uncertainty estimates and metadata. Any existing NEE and LE may be used to build and improve the models used to generate forecasts. Other data can be used so long as they are not from the month being forecast and the data are made publicly available (minimum of URL, but ideally a script) and accessible to all teams in the challenge.

## Data: Targets 

The challenge uses the following NEON data products:  

[DP4.00200.001](https://data.neonscience.org/data-products/DP4.00200.001){target="_blank"}: Bundled data products - eddy covariance   

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation. A processing script is available on the neon4cast-terrestrial GitHub repository: https://github.com/eco4cast/neon4cast-terrestrial/blob/master/02_terrestrial_targets.R

### Net ecosystem exchange

**Definition**

Net ecosystem exchange (NEE) is the net movement of carbon dioxide from the atmosphere to the ecosystem.  At the 30-minute time resolution it is reported as $\mu$mol CO<sub>2</sub> m<sup>-2</sup> s<sup>-1</sup>.  At the daily time resolution it is reported as g C m<sup>-2</sup> day<sup>-1</sup>. Negative values correspond to an ecosystem absorbing CO<sup>2</sup> from the atmosphere, positive values correspond to an ecosystem emitting CO<sub>2</sub> to the atmosphere.

**Motivation**

NEE quantifies the net exchange of CO<sub>2</sub> between the ecosystem and the atmosphere over that 30-minute or daily time period.  Assessing skill at predicting 1/2 hourly - sub daily measurements provides more insight into ability to capture diel processes. The diel curve contains information on how plants and soil immediately respond to variations in meteorology. 

Making daily predictions will allow us to rapidly assess skill and provide information in a timeframe pertinent to inform and implement natural resource management. It also allows for models that do not produce sub-daily estimates to participate

### Latent heat flux

**Definition**

Latent heat flux is the movement of water as water vapor from the ecosystem to the atmosphere.  It is reported as W m<sup>-2</sup> (equivalent to J m<sup>-2</sup> s<sup>-1</sup>).  At the daily time resolution it is reported as mean W m<sup>-2</sup>. Positive values correspond to a transfer of water vapor from the ecosystem to the atmosphere.

**Motivation**

Latent heat measures the water loss from an ecosystem to the atmosphere through evapotranspiration (transpiration through plants + evaporation from surfaces).  

Forecasting latent heat (evapotranspiration) can provide insights to water stress for plants and the efficiency that plants are using water relative to NEE, and to the amount of liquid water remaining in the soil for soil moisture forecasting

### Focal sites

Information on the sites can be found here:


```r
site_data <- readr::read_csv("https://raw.githubusercontent.com/eco4cast/neon4cast-terrestrial/master/Terrestrial_NEON_Field_Site_Metadata_20210928.csv")
```


|siteID |site name                                                   |vegetation type                                                        | latitude| longtitude|NEON site URL                                |
|:------|:-----------------------------------------------------------|:----------------------------------------------------------------------|--------:|----------:|:--------------------------------------------|
|BART   |Bartlett Experimental Forest NEON                           |Deciduous Forest&#124;Evergreen Forest&#124;Mixed Forest               | 44.06389|  -71.28737|https://www.neonscience.org/field-sites/bart |
|CLBJ   |Lyndon B. Johnson National Grassland NEON                   |Deciduous Forest&#124;Grassland/Herbaceous                             | 33.40123|  -97.57000|https://www.neonscience.org/field-sites/clbj |
|KONZ   |Konza Prairie Biological Station NEON                       |Deciduous Forest&#124;Grassland/Herbaceous                             | 39.10077|  -96.56307|https://www.neonscience.org/field-sites/konz |
|ORNL   |Oak Ridge NEON                                              |Deciduous Forest&#124;Evergreen Forest&#124;Pasture/Hay                | 35.96413|  -84.28259|https://www.neonscience.org/field-sites/ornl |
|OSBS   |Ordway-Swisher Biological Station NEON                      |Emergent Herbaceous Wetlands&#124;Evergreen Forest&#124;Woody Wetlands | 29.68928|  -81.99343|https://www.neonscience.org/field-sites/osbs |
|SJER   |San Joaquin Experimental Range NEON                         |Evergreen Forest&#124;Grassland/Herbaceous&#124;Shrub/Scrub            | 37.10878| -119.73228|https://www.neonscience.org/field-sites/sjer |
|SRER   |Santa Rita Experimental Range NEON                          |Shrub/Scrub                                                            | 31.91068| -110.83549|https://www.neonscience.org/field-sites/srer |
|TALL   |Talladega National Forest NEON                              |Deciduous Forest&#124;Evergreen Forest&#124;Mixed Forest               | 32.95047|  -87.39326|https://www.neonscience.org/field-sites/tall |
|UNDE   |University of Notre Dame Environmental Research Center NEON |Deciduous Forest&#124;Mixed Forest&#124;Woody Wetlands                 | 46.23391|  -89.53725|https://www.neonscience.org/field-sites/unde |
|WREF   |Wind River Experimental Forest NEON                         |Evergreen Forest                                                       | 45.82049| -121.95191|https://www.neonscience.org/field-sites/wref |

### 30-minute target data calculation

To create the data for evaluation (and training) for NEE and LE we extract NEE and LE that pass the turbulence quality control flags (`qfqm.fluxCo2.turb.qfFinl` = 0 ) provided by NEON and has flux values between -50 and 50 umol CO2 m<sup>-2</sup> s<sup>-1</sup>.

The table with the half-hour NEE and LE has the following columns

- `time`: YYYY-MM-DD HH:MM for the start of the 30-minute period in UTC  
- `siteID`: NEON site code (e.g., BART)     
- `nee`:  umol CO2 m<sup>-2</sup> s<sup>-1</sup>   
- `le`: W m<sup>-2</sup>   
- `nee_sd_intercept`: intercept in the nee observation uncertainty standard deviation   
- `nee_sd_slopeP`: slope in the relationship between nee and observation uncertainty standard deviation for positive values of nee   
- `nee_sd_slopeN`: slope in the relationship between nee and observation uncertainty standard deviation for negative values of nee   
- `le_sd_intercept`: intercept in the le observation uncertainty standard deviation   
- `le_sd_slopeP`:slope in the relationship between le and observation uncertainty standard deviation for positive values of le  
- `le_sd_slopeN`: slope in the relationship between le and observation uncertainty standard deviation for negative values of le   

The observation uncertainty estimates for nee and le are derived from the [PEcAN project](https://pecanproject.github.io/){target="_blank"} and can be used by `sd_nee <- nee_sd_intercept + nee_sd_slopeP * nee`.  They are not supplied by NEON.

Here is the download link and format of the `terrestrial_30min` target file:


```r
readr::read_csv("https://data.ecoforecast.org/targets/terrestrial_30min/terrestrial_30min-targets.csv.gz", guess_max = 1e6)
```

```
## # A tibble: 900,760 × 10
##    time                siteID    nee      le nee_sd_intercept nee_sd_slopeP
##    <dttm>              <chr>   <dbl>   <dbl>            <dbl>         <dbl>
##  1 2017-02-01 10:00:00 BART   -0.574 -0.413              1.13         0.205
##  2 2017-02-01 10:30:00 BART    0.297 -0.127              1.13         0.205
##  3 2017-02-01 11:00:00 BART   NA     NA                  1.13         0.205
##  4 2017-02-01 11:30:00 BART   NA     NA                  1.13         0.205
##  5 2017-02-01 12:00:00 BART    0.224 -0.0333             1.13         0.205
##  6 2017-02-01 12:30:00 BART    2.12   1.44               1.13         0.205
##  7 2017-02-01 13:00:00 BART    2.18   2.49               1.13         0.205
##  8 2017-02-01 13:30:00 BART   NA     NA                  1.13         0.205
##  9 2017-02-01 14:00:00 BART   NA     NA                  1.13         0.205
## 10 2017-02-01 14:30:00 BART   NA     NA                  1.13         0.205
## # … with 900,750 more rows, and 4 more variables: nee_sd_slopeN <dbl>,
## #   le_sd_intercept <dbl>, le_sd_slopeP <dbl>, le_sd_slopeN <dbl>
```

The code used to generate the targets from NEON data can be found [here](https://github.com/eco4cast/neon4cast-terrestrial/blob/master/02_terrestrial_targets.R)

### Daily target data calculation

To evaluate the models that produce daily flux forecasts, we select only days with at least 24 of 48 half hours that pass the quality control flags.  For these days, we average the half-hours and convert carbon to daily units (gC/m2/day).  The daily data table has the following columns.

- `time`: YYYY-MM-DD (the day is determined using UTC time)  
- `siteID`: NEON site code (e.g., BART)  
- `nee`: g C m<sup>-2</sup> day<sup>-1</sup>  
- `le`:  W m<sup>-2</sup>  

Here is the download link and format of the `terrestrial_daily` target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/terrestrial_daily/terrestrial_daily-targets.csv.gz", guess_max = 1e6)
```

```
## # A tibble: 18,770 × 4
##    time       siteID   nee    le
##    <date>     <chr>  <dbl> <dbl>
##  1 2017-02-01 BART      NA    NA
##  2 2017-02-01 CLBJ      NA    NA
##  3 2017-02-01 KONZ      NA    NA
##  4 2017-02-01 ORNL      NA    NA
##  5 2017-02-01 OSBS      NA    NA
##  6 2017-02-01 SJER      NA    NA
##  7 2017-02-01 SRER      NA    NA
##  8 2017-02-01 TALL      NA    NA
##  9 2017-02-01 UNDE      NA    NA
## 10 2017-02-01 WREF      NA    NA
## # … with 18,760 more rows
```

The code used to generate the targets from NEON data can be found [here](https://github.com/eco4cast/neon4cast-terrestrial/blob/master/02_terrestrial_targets.R)

## Timeline

Forecasts for a minimum of 35 days can be submitted daily by 6 pm ET throughout 2022. A minimum of 35 days in the future must be forecasted for each submission. For example, a forecast submitted on February 1 should be for at least February 1st – March 7th, but it could be for the full spring. New forecasts can be submitted daily as new weather forecasts and observations (e.g., NEE) become available. Processed NEE and LE data will be available daily by 11:59 pm ET for each day. The key is that submissions are predictions of the future.

Daily submissions are allowed and encouraged as new observations and weather forecasts become available, therefore the automation of forecast generation may be ideal.  There are many ways to automate scripts that are written to download observations and metreology drivers, generate forecasts, and submit forecasts. Two tools that many have used are cron jobs (see the R package [cronR](https://cran.r-project.org/web/packages/cronR/index.html){target="_blank"}) that execute tasks at user specifics times and [github actions](https://youtu.be/dMrUlXi4_Bo){target="_blank"}.  See more at [Frequently Asked Questions]    

Cron jobs work on unix and mac systems.  An example of a script that executes a cron job using R can be found [here](https://github.com/eco4cast/neon4cast-phenology/blob/master/cron_automation.R){target="_blank"}.

## Flux data latency

NEON data officially releases the flux data on their data portal and API in monthly data packages.  Data for a given month is scheduled to be released around the 15th of the following month. 

NEON is also processing flux data with only a 5 day delay (latency).  Any data that has been processed but not included in a released monthly package is available on NEON s3 storage.  The list of files that can be downloaded can found [here](https://s3.data.neonscience.org/neon-sae-files/ods/sae_files_unpublished/sae_file_url_unpublished.csv).  

Our targets file is the combination of NEON's monthly releases and the files on the s3 bucket.  As a result, flux data within 5-days of the restart of a forecast are available to inform the forecast.

The reduction of the latency from monthly to 5-days allows this theme to forecast in real-time - a major advancement for this forecasting challenge.  Thank you NEON!

## Submissions

Instructions for submitting forecasts are found here: [Submission Instructions]

The specific file format for the terrestrial_daily theme is here: [Terrestrial daily]

The specific file format for the terrestrial_30min theme is here: [Terrestrial 30 min]

## Meterological inputs for modeling

Information about forecasted meteorology that is available for you to use when generating your forecasts can be found here: [Meteorology Inputs] 
## Useful functions

Functions for validating, evaluating and submitting forecasts can be found here: [Helpful Functions]

Functions for downloading and working with the meteorology forecasts can be be found here: [Access EFI snapshots of NOAA forecasts at NEON sites]

## Null models

Two null models are automatically generated each day - these are simple baseline models.  The persistence null model uses the most recent measurement of nee or le and predicts that the values will be constant in the future.  The climatology null model forecasts that the nee or lee will be equal to the historical mean of that day of year.  We apply both the persistence and climatology model to the daily fluxes and the climatology to the 30 minute fluxes

Code for the daily persistence null model can be found [here](https://github.com/eco4cast/neon4cast-terrestrial/blob/master/03_terrestrial_flux_30min_persistance.R){target="_blank}

Code for the daily climatology null model can be found [here](https://github.com/eco4cast/neon4cast-terrestrial/blob/master/03_terrestrial_flux_daily_climatology.R){target="_blank"}

Code for the 30 minute climatology null model can be found [here](https://github.com/eco4cast/neon4cast-terrestrial/blob/master/03_terrestrial_flux_30min_clim.R){target="_blank"}

## FAQ

Answers to frequency asks questions can be found here: [Frequently Asked Questions]

## Design team 

George Burba, LI-COR Biosciences  
Jamie Cleverly, Terrestrial Ecosystem Research Network (TERN)   
Ankur Desai, University of Wisconsin, Madison   
Mike Dietze, Boston University   
Andy Fox, Joint Center for Satellite Data Assimilation   
William Hammond, Oklahoma State University  
Danica Lombardozzi, National Center for Atmospheric Research   
Quinn Thomas, Virginia Tech  
Jody Peters, University of Notre Dame
Alex Young, SUNY - College of Environmental Science & Forestry  

## Partners

Data used in the challenge are from the National Ecological Observatory Network ([NEON](https://www.neonscience.org/){target="_blank"})

[Ameriflux](https://ameriflux.lbl.gov/){target="_blank"} is an excellent database of eddy-covariance data, including historical data for some of the four challenge sites.

Terrestrial Ecosystem Research Network [(TERN)](https://www.tern.org.au/){target="_blank"} has been involved in the design of the challenge.

