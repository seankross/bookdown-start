# Theme: Phenology

**What**: Terrestrial phenology defined by daily greenness of plants 

**Where**: 8 deciduous broadleaf forest NEON sites in the continental U.S.

**When**: Daily forecasts for 35-days in the future from February 1 - July 1, 2021 with a second round being run for the autumn. Forecast submissions are accepted daily, and later submissions after the February 1 start are permissible.

**Why**: Phenology has been identified as one of the primary ecological fingerprints of global climate change.

**Who**: Open to any individual or team that registers

**How**: REGISTER your team and submit forecast

We held a Q&A session on January 27, 2021. You can find a recording from that session HERE.

## Overview

Phenology has been shown to be a robust integrator of the effects of year-to-year climate variability and longer-term climate change on natural systems (e.g., recent warming trends). Experimental studies have shown how other global change factors (e.g., elevated CO2 and N deposition) can also influence phenology. There is a need to better document biological responses to a changing world, and improved phenological monitoring at scales from individual organisms to ecosystems, regions, and continents will contribute to achieving this goal.

Phenology researchers often use digital cameras (such as those that are part of the PhenoCam Network) that take regular repeated images of plant canopies to monitor changes in greenness throughout the year. The PhenoCam Network is a cooperative continental-scale phenological observatory that uses digital repeat photography to track vegetation phenology in a diverse range of ecosystems across North America and around the World. Imagery and data are made publicly available in near-real-time through the PhenoCam webpage: http://phenocam.sr.unh.edu/.

## Challenge

This is an open ecological forecasting challenge to forecast spring green-up of the common greenness index (GCC), as measured by digital cameras at various deciduous broadleaf NEON sites. The forecasts will be forecasts of daily mean GCC (specifically the 90% quantile, which has been shown to be more robust). The sites include Harvard Forest (HARV), Bartlett Experimental Forest (BART), Smithsonian Conservation Biology Institute, (SCBI), Steigerwaldt Land Services (STEI), The University of Kansas Field Station, KS (UKFS), Great Smoky Mountains National Park (GRSM), Dead Lake (DELA), and National Grassland (CLBJ).

NOAA Global Ensemble Forecast System weather forecasts for each NEON site is provided for teams to use: https://data.ecoforecast.org/minio/drivers/noaa/

Teams must provide access (minimum of URL, but ideally a script) to any additional data they wish to use to all teams in the challenge. Teams of various career stages and disciplines are encouraged to submit forecasts.

Submissions of forecast and metadata will be through https://data.ecoforecast.org/minio/submissions/ using prescribed file formats described in the challenge theme documentation (PENDING).

Forecasts will be scored and compared using the Continuous Ranked Probability Score, a metric that combines accuracy and uncertainty estimation (Gneiting, T., & Raftery, A. E., 2007). 

## Data: Training and Evaluation:

The challenge uses the following NEON data products:
DP1.00033.001: Phenology images

## Data: Targets

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation. Before the Phenology challenge begins, a processing script will be available in the neon4cast-phenology GitHub repository.

## Detailed protocol  

Details of the targets, how they are calculated, descriptions of the target files, and examples of other environmental variables that could be used in the Challenge are HERE. 

Access Targets HERE

Download an example of a forecast output format for submission in netcdf format using ensemble members is here: HERE
Download an example of a forecast output format for submission in csv format using summary statistics is here: HERE

## Timeline

Forecasts for a minimum of 35 days can be submitted daily by 6 pm ET for the period of February 1st through July 1st, 2021. Forecast should be submitted starting February 1st by 6 pm ET. A minimum of 35 days in the future must be forecasted for each submission. For example, the first submitted forecast should be for at least February 1st – March 7th, but it could be for the full spring. New forecasts can be submitted daily as new weather forecasts and observations (e.g., PhenoCam) become available. Processed PhenoCam data will be available daily by 11:59 pm ET for each day. Teams are allowed to start submitting forecasts after February 1st, but only forecasts of future days (when submitted) will be allowed. Late forecasts might be allowed under extenuating circumstances related to computer failure or processing delayed on our end. Forecasts do not have to be submitted daily and can be longer than 35 days.

## Design team

Kathryn Wheeler, Boston University  
Michael Dietze, Boston University  
Kathy Gerst, National Phenology Network  
Chris Jones, NC State University  
Andrew Richardson, Northern Arizona University  
Bijan Seyednasrollah, Northern Arizona University, PhenoCam Network   

## Partners

The challenge is hosted by the Ecological Forecasting Initiative (EFI; https://ecoforecast.org/) and its U.S. National Science Foundation sponsored Research Coordination Network (EFI-RCN; https://ecoforecast.org/rcn/).

Data used in the challenge are collected by the National Ecological Observatory Network (NEON; https://www.neonscience.org/) and hosted by the Phenocam Network (http://phenocam.sr.unh.edu/). 

The forecasting challenge was developed in collaboration with the USA National Phenology Network: https://www.usanpn.org/usa-national-phenology-network.

## References

Gneiting, T., & Raftery, A. E. (2007). Strictly proper scoring rules, prediction, and estimation. Journal of the American Statistical Association, 102(477), 359–378. https://doi.org/10.1198/016214506000001437
