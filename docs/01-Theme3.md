# Theme: Tick Populations

**What:** *Amblyomma americanum* and *Ixodes scapularis* nymphal tick abundance per sampled area

**Where:** 22 plots at 7 NEON sites 

**When:** Weekly forecasts for 34 weeks into the future starting March 31-October 31, 2021 with training data available January 31, 2021. Forecasts are submitted monthly and later submissions after the March 31 start are permissible.

**Why:** There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

**Who**: Open to any individual or team that registers

**How**: REGISTER your team and submit forecast

## Overview

Target species for the population forecasts are *Amblyomma americanum* and *Ixodes scapularis* nymphal ticks. *A. americanum* is a vector of ehrlichiosis, tularemia, and southern tick-associated rash illness, while *I. scapularis* is a vector for Lyme disease, the most prevalent tick-borne disease in North America. Both species are present in the eastern United States, and have been collected at numerous NEON sites. There is a correlation between tick population abundance and disease incidence, meaning forecasts for tick abundance have the potential to aid in our understanding of disease risk through time and space. 

## Challenge 

The challenge is open to any individual, group, or institution that may want to participate. The goals of this challenge are to forecast total Ixodes scapularis and Amblyomma americanum nymphs each epidemiological week (Sun-Sat) per sampled area at a set of NEON plots within NEON sites. Due to challenges in data collected in 2020, this round of the forecasting challenge will simulate a true forecasting challenge by focusing on data from the 2019 field season.

NOAA Global Ensemble Forecast System weather forecasts for each NEON site is provided for teams to use: https://data.ecoforecast.org/minio/drivers/noaa/

Teams must provide access (minimum of URL, but ideally a script) to any additional data they wish to use to all teams in the challenge. Teams of various career stages and disciplines are encouraged.

Submissions of forecast and metadata will be through https://data.ecoforecast.org/minio/submissions/ using prescribed file formats described in the challenge theme documentation (PENDING).

Forecasts will be scored and compared using the Continuous Ranked Probability Score, a metric that combines accuracy and uncertainty estimation (Gneiting, T., & Raftery, A. E., 2007). 

## Data: Training and Evaluation:

The challenge uses the following NEON data products:
DP1.10093.001: Ticks sampled using drag cloths

Total *Ixodes scapularis* will be forecasting for the following plots (siteID_plotID): 

BLAN_012, BLAN_005, SCBI_013, SCBI_002, SERC_001, SERC_005, SERC_006, SERC_012, ORNL_007

Total *Amblyomma americanum* will be forecasting for the following plots (siteID_plotID): 

SCBI_013, SERC_001, SERC_005, SERC_006, SERC_002, SERC_012, KONZ_025, UKFS_001, UKFS_004, UKFS_003, ORNL_002, ORNL_040, ORNL_008, ORNL_007, ORNL_009, ORNL_003, TALL_001, TALL_008, TALL_002

## Data: Targets

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation. Before the Tick challenge begins, a processing script will be available in the neon4cast-ticks GitHub repository.

## Detailed protocol 

Details of the targets, how they are calculated, descriptions of the target files, and examples of other environmental variables that could be used in the Challenge are HERE. 

Access Targets HERE

Download an example of forecast output format for submission HERE

## Timeline

The timeline for this challenge will be monthly, which is how often new data will be released by the EFI RCN. 

The final data set containing the training data will be available no later than January 31st, 2021. The challenge will begin (first forecast submission) on March 31st, 2021 at 11:59 PM Eastern Standard Time, and will run through October 31st, 2021 (last forecast submission). 

2019 data will be released on the first of the month following a submission deadline, which gives teams a month to assimilate new data. For example, the forecasts submitted on March 31st, 2021 will be for every epidemiological week starting at the beginning of March 2019 through the end of November 2019. Then, on April 1st, 2021, tick counts from March 2019 will be released. The next forecast submission is April 30th, 2021, which will be for every epidemiological week starting at the beginning of April 2019 through the end of November 2019. The table below shows which epidemiological weeks are to be forecasted for each submission date.

2021 FORECAST SUBMISSION DATE	2019 TARGET EPIDEMIOLOGICAL WEEKS
March 31	10-44
April 30	14-44
May 31	19-44
June 30	23-44
July 31	28-44
August 31	32-44
September 31	36-44
October 31	41-44

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

The challenge is hosted by the Ecological Forecasting Initiative (EFI; https://ecoforecast.org/) and its U.S. National Science Foundation sponsored Research Coordination Network (EFI-RCN; https://ecoforecast.org/rcn/).

Data used in the challenge are collected by the National Ecological Observatory Network (NEON; https://www.neonscience.org/).

## References

Gneiting, T., & Raftery, A. E. (2007). Strictly proper scoring rules, prediction, and estimation. Journal of the American Statistical Association, 102(477), 359–378. https://doi.org/10.1198/016214506000001437
