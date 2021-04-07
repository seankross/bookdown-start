# Theme: Aquatic Ecosystems

**What:** Freshwater surface water temperature and dissolved oxygen

**Where:** 1 lake and 1 river NEON sites. 

**When:** Daily forecasts with a 7-day forecast horizon at the beginning of the month and submitted monthly from May 31-August 2021; later submissions after the May 31 start are permissible

**Why:** Freshwater surface water temperature and dissolved oxygen are critical for life in aquatic environments and can represent the health of the system

**Who:** Open to any individual or team that registers

**How:** [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast

## Overview

In streams and rivers, forecasting water temperature can be meaningful for protecting aquatic communities while maintaining socio-economic benefits (Ouellet-Proulx et al. 2017). In lentic systems, successfully forecasting surface water temperatures can be important for fisheries and water utilities that need to manage the outflowing temperatures (Zhu et al. 2020). Recently, water temperature forecasts in lakes have been used to predict seasonal turnover when nutrients from the bottom can be mixed to the surface and impair the water quality. 

Dissolved oxygen concentration is a critically important variable in limnology. Forecasts of dissolved oxygen in freshwaters is the first step to understanding other freshwater ecosystem processes. For example, oxygen serves as the gatekeeper to other biogeochemical reactions that occur in rivers and lakes. Preemptive forecasts of dissolved oxygen concentrations can anticipate periods of high or low oxygen availability, thereby providing insight into how the ecosystem may change at relatively short timescales. 

## Challenge

This design challenge asks teams to produce forecasts of mean daily surface water temperature and/or dissolved oxygen in one NEON lake and/or one NEON river site in the Southeastern U.S. 7 days from the first of the month. The NEON lake site is Barco Lake (BARC) in Florida and the NEON river site is Posey Creek (POSE) in Virginia. Each forecast will start on the 1st day of each month and must forecast up to 7 days into the future. Forecasts are welcome to go past the 7 day timeline but those dates will not be evaluated. 

Teams are asked to submit their 7 day forecasts of NEON surface water temperature and/or dissolved oxygen measurements along with uncertainty estimates and metadata. Any NEON surface water temperature and/or dissolved oxygen data prior to the 7 days being forecasted will be provided and may be used to build and improve the forecast models. Other data (other than temperature and/or dissolved oxygen data provided from NEON) can be used so long as they are not from the 7 days being forecasted at the beginning of each month, that they are publicly available, and that teams provide access (minimum of URL, but ideally a script) to all teams in the challenge.

## Data: Targets

The R script for generating the evaluation and training data (i.e., targets) can be found at: https://github.com/eco4cast/neon4cast-aquatics

The challenge uses the following NEON data products:
[DP1.20264.001](https://data.neonscience.org/data-products/DP1.20264.001){target="_blank"}: Temperature at specific depth in surface water   
[DP1.20288.001](https://data.neonscience.org/data-products/DP1.20288.001){target="_blank"}: Water quality

A file with previously released NEON data that has been processed into targets is provided below. The target script can be found here. The same processing will be applied to new data that are used for forecast evaluation. Before the Aquatics challenge begins, a [processing script](https://github.com/eco4cast/neon4cast-aquatics/blob/master/02_generate_targets_aquatics.R){target="_blank"} is available in the neon4cast-aquatics GitHub repository.

Here is the format of the target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/aquatics/aquatics-targets.csv.gz")
```

```
## # A tibble: 2,618 x 9
##    time       siteID oxygen temperature oxygen_sd temperature_sd depth_oxygen
##    <date>     <chr>   <dbl>       <dbl>     <dbl>          <dbl>        <dbl>
##  1 2017-10-20 BARC     6.01        26.4   0.0114        0.00104          1.19
##  2 2017-10-21 BARC     6.06        26.3   0.00717       0.000986         1.20
##  3 2017-10-22 BARC     6.13        26.4   0.00721       0.00119          1.19
##  4 2017-10-23 BARC     6.43        26.6   0.00765       0.000944         1.16
##  5 2017-10-24 BARC     6.31        26.4   0.00746       0.00118          1.11
##  6 2017-10-25 BARC     6.27        25.9   0.00737       0.00107          1.13
##  7 2017-10-26 BARC     6.30        25.0   0.00743       0.00105          1.19
##  8 2017-10-27 BARC     6.41        24.3   0.00762       0.00104          1.22
##  9 2017-10-28 BARC     6.48        24.1   0.00766       0.00111          1.17
## 10 2017-10-29 BARC     6.64        23.8   0.00783       0.00101          1.10
## # … with 2,608 more rows, and 2 more variables: depth_temperature <dbl>,
## #   neon_product_ids <chr>
```
The target file has the following columns   

- `time`: date of observation    
- `siteID`: NEON site code    
- `oxygen`: oxygen (mg/L)   
- `temperature`: temperature (Celsius)   
- `oxygen_sd`: standard deviation of oxygen observation as reported by NEON    
- `temperature_sd`: standard deviation of temperature observation as reported by NEON   
- `depth_oxygen`: depth in meters of oxygen observation   
- `depth_temperature`: depth in meters of temperature observation   
- `neon_product_ids`: NEON data product ids   

### Surface Mean Daily Dissolved Oxygen Concentration

**Definition**

Dissolved oxygen (DO) is the concentration of oxygen dissolved in water. NEON’s 30-minute time resolution from deployed water quality sondes among the freshwater sites reports this concentration as mg L<sup>-1</sup>. We have adapted the available NEON DO data to output the mean daily DO concentration in mg L<sup>-1</sup> from a water quality sonde deployed 1m below the water surface at a lake site (Barco Lake) and a water quality sonde deployed in a stream site (Posey Creek). Common DO concentrations range between 0 and 12 mg L<sup>-1</sup> and DO concentrations less than 2 mg L<sup>-1</sup> are considered hypoxic. 

**Motivation**

Dissolved oxygen concentration is a critically important variable in limnology. Forecasts of dissolved oxygen in freshwaters is the first step to understanding other freshwater ecosystem processes. For example, oxygen serves as the gatekeeper to other biogeochemical reactions that occur as well as determine the variety and health of aquatic organisms present in rivers and lakes. Preemptive forecasts of dissolved oxygen concentrations can anticipate periods of high or low oxygen availability, thereby providing insight into how the ecosystem may change at relatively short timescales. 

### Surface Mean Daily Water Temperature

**Definition**

Water temperature is the temperature of the water. NEON’s 30-minute time resolution from deployed water temperature sondes in the freshwater sites reports this in degrees celsius (°C). We have adapted the available NEON water temperature data to output the mean daily water temperature in °C from a water temperature sonde deployed 1m below the water surface at a lake site (Barco Lake) and a water temperature sonde deployed in a stream site (Posey Creek). Common water temperatures in lakes and streams range between 4 and 35 °C.

**Motivation**

In streams and rivers, forecasting water temperature can be meaningful for protecting aquatic communities while maintaining socio-economic benefits (Ouellet-Proulx et al. 2017). In lentic and lotic systems, successfully forecasting water temperatures can be important for management of fisheries and water utilities that rely on specific threshold  temperatures (Zhu et al. 2020). Recently, lake temperature forecasts have been used to predict seasonal turnover, mixing bottom nutrients into the surface and impairing water quality.Data

### Focal sites

![](images/Barco Posey Sites.png)

| Site Name       | SiteID     | NEON Domain     | Latitude  |  Longitude | Ecosystem Type |
| :------------- | :----------: | -----------: | -----------: | -----------: | -----------: |
|  [Lake Barco, FL](https://www.neonscience.org/field-sites/bart){target="_blank"} | BART  | D03: Southeast    | 29.67598 | -82.00841 | Lake | 
|  [Posey Creek, VA](https://www.neonscience.org/field-sites/pose){target="_blank"} | POSE  | D02: Mid-Atlantic    | 38.89431 | -78.14726 | Stream | 

## Timeline

The timeline is determined by the data latency provided by NEON. NEON data is released in month long sets, 2 weeks after the month ends. 
NEON data for a given month is scheduled to be released around the 15th of the following month. Once the NEON data for a previous month is released, teams have between the release of those data to the end of the month to forecast the 7 days of the current month (see table). 

Forecast submissions are due beginning May 31, 2021 at 11:59 Eastern Standard Time (UTC−05:00) for forecasts that start May 1. Final forecast submissions are due on August 31, 2021 at 11:59 Eastern Standard Time (UTC−05:00) for forecasts that start August 1.

As an example, if NEON water temperature data is released on April 15 for data from March 1 - 31, teams then can use these new March data and the NOAA GEFS forecast issued on April 1 at 00:00 to help generate forecasts from April 1 - April 8 (7 days). This April forecast is due by 11:59 pm EST on April 30. The forecast issue date for the April forecast is April 1, so no new observational data from after that date can be used to constrain forecasts and the forecast should use the weather forecast issued at midnight April 1 (i.e. start of day) as the driver (not the observed meteorology in April or forecasts made at later dates).

Evaluation will occur as new NEON data is released.

![Forecast Timeline Table](images/Aquatics Forecast Timeline.png)

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
