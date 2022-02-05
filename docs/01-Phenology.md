# Theme:  Phenology

**What**: Terrestrial phenology defined by daily greenness and redness of plants 

**Where**: 10 deciduous broadleaf forest, 6 grassland, and 2 shrubland NEON sites in the continental U.S.

**When**: Daily forecasts for 35-days in the future. Forecast submissions are accepted daily throughout 2022.  The only requirement is that submissions are predictions of the future.

**Why**: Phenology has been identified as one of the primary ecological fingerprints of global climate change.

**Who**: Open to any individual or team that registers

**How**: [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ){target="_blank"} your team and submit forecast.  If you registered for the Round 1 (2021) and are using the same team and method then you do not need to re-register.

The video below is an overview of the Phenology Challenge that was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/P8OwhCF4AdI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

We held a Q&A session on January 27, 2021. You can find a recording from that session [HERE](https://www.youtube.com/watch?v=UwX2IA1vDQE&feature=youtu.be){target="_blank"}.



## Overview

Phenology has been shown to be a robust integrator of the effects of year-to-year climate variability and longer-term climate change on natural systems (e.g., recent warming trends). Experimental studies have shown how other global change factors (e.g., elevated CO<sub>2</sub> and N deposition) can also influence phenology. There is a need to better document biological responses to a changing world, and improved phenological monitoring at scales from individual organisms to ecosystems, regions, and continents will contribute to achieving this goal.

Phenology researchers often use digital cameras (such as those that are part of the PhenoCam Network) that take regular repeated images of plant canopies to monitor changes in greenness and redness throughout the year. The PhenoCam Network is a cooperative continental-scale phenological observatory that uses digital repeat photography to track vegetation phenology in a diverse range of ecosystems across North America and around the World. Imagery and data are made publicly available in near-real-time through the PhenoCam webpage: http://phenocam.sr.unh.edu/.

## Challenge

This is an open ecological forecasting challenge to forecast spring green-up of the greenness (gcc) and redness (rcc) indices, as measured by digital cameras at various NEON sites. The forecasts will be forecasts of daily mean gcc and rcc (specifically the 90% quantile called the gcc_90 and rcc_90) for a region of interests with each site's digital photograph.

Teams must provide access (minimum of URL, but ideally a script) to any additional data they wish to use to all teams in the challenge. Teams of various career stages and disciplines are encouraged to submit forecasts.

## Data: Targets

The challenge uses the following NEON data products:

[DP1.00033.001](https://data.neonscience.org/data-products/DP1.00033.001){target="_blank"}: Phenology images

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation. The processing script is available on the [neon4cast-phenology GitHub repository](https://github.com/eco4cast/neon4cast-phenology/blob/master/01_download_phenocam_data.R){target="_blank"}.

### Green chromatic coordinate (gcc)

**Definition**

The ratio of the green digital number to the sum of the red, green, blue digital numbers from a digital camera.  `gcc_90` is the 90th percentile of the gcc within a set of pixel called a region of interest (ROI)

**Motivation**

Quantitative metrics of vegetation color extracted from PhenoCam imagery provide data that are consistent with ground observations of phenology and as well as other conventional vegetation indices across ecosystems. 

### Red chromatic coordinate (rcc)

**Definition**

The ratio of the red digital number to the sum of the red, green, blue digital numbers from a digital camera.  `rcc_90` is the 90th percentile of the rcc within a set of pixel called a region of interest (ROI)

**Motivation**

While gcc is primarily a metric of vegetation greeness, rcc is more a metric of fall color. Adding rcc to the autumn forecast challenge has two motivations. First, from an end-user's perspective the timing of peak fall coloration has aesthetic value, which translates into economic for tourism. Second, from the ecological perspective, autumn phenology involves two distinct (but coupled) processes, senescence (loss of leaf chlorophyll and photosythetic activity; translocation of nutrients) and abscission (actual leaf fall). Forecasting two indices helps us disentangle our ability to predict these two processes.


### Focal sites

Information on the sites can be found here:


```r
site_data <- readr::read_csv("https://raw.githubusercontent.com/eco4cast/neon4cast-phenology/master/Phenology_NEON_Field_Site_Metadata_20210928.csv", show_col_types = FALSE)
```


|siteID |site name                                       |Phenocam vegetation type |Phenocam code           |Phenocam ROI |NEON site URL                                |
|:------|:-----------------------------------------------|:------------------------|:-----------------------|:------------|:--------------------------------------------|
|BART   |Bartlett Experimental Forest NEON               |deciduous broadleaf      |NEON.D01.BART.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/bart |
|CLBJ   |Lyndon B. Johnson National Grassland NEON       |deciduous broadleaf      |NEON.D11.CLBJ.DP1.00033 |DB_2000      |https://www.neonscience.org/field-sites/clbj |
|DELA   |Dead Lake NEON                                  |deciduous broadleaf      |NEON.D08.DELA.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/dela |
|GRSM   |Great Smoky Mountains National Park NEON        |deciduous broadleaf      |NEON.D07.GRSM.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/grsm |
|HARV   |Harvard Forest & Quabbin Watershed NEON         |deciduous broadleaf      |NEON.D01.HARV.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/harv |
|MLBS   |Mountain Lake Biological Station NEON           |deciduous broadleaf      |NEON.D07.MLBS.DP1.00033 |DB_2000      |https://www.neonscience.org/field-sites/mlbs |
|SCBI   |Smithsonian Conservation Biology Institute NEON |deciduous broadleaf      |NEON.D02.SCBI.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/scbi |
|SERC   |Smithsonian Environmental Research Center NEON  |deciduous broadleaf      |NEON.D02.SERC.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/serc |
|STEI   |Steigerwaldt-Chequamegon NEON                   |deciduous broadleaf      |NEON.D05.STEI.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/stei |
|UKFS   |University of Kansas Field Station NEON         |deciduous broadleaf      |NEON.D06.UKFS.DP1.00033 |DB_1000      |https://www.neonscience.org/field-sites/ukfs |
|CPER   |Central Plains Experimental Range NEON          |grassland                |NEON.D10.CPER.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/cper |
|DSNY   |Disney Wilderness Preserve NEON                 |grassland                |NEON.D03.DSNY.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/dsny |
|JORN   |Jornada Experimental Range NEON                 |grassland                |NEON.D14.JORN.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/jorn |
|KONZ   |Konza Prairie Biological Station NEON           |grassland                |NEON.D06.KONZ.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/konz |
|OAES   |Marvin Klemme Range Research Station NEON       |grassland                |NEON.D11.OAES.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/oaes |
|WOOD   |Chase Lake National Wildlife Refuge NEON        |grassland                |NEON.D09.WOOD.DP1.00033 |GR_1000      |https://www.neonscience.org/field-sites/wood |
|ONAQ   |Onaqui NEON                                     |shrubland                |NEON.D15.ONAQ.DP1.00033 |SH_1000      |https://www.neonscience.org/field-sites/onaq |
|SRER   |Santa Rita Experimental Range NEON              |shrubland                |NEON.D14.SRER.DP1.00033 |SH_1000      |https://www.neonscience.org/field-sites/srer |

### Target data calculation

Digital cameras mounted above forests are pointed at the forest canopy.  Images are collected every half hour.

The images are a set of pixels values in red, green, and blue color channels (RGB).  A pixel value is an 8-bit digital number (DN). Because internal processing (including exposure control) and external factors affecting scene illumination (weather and atmospheric effects) both influence the retrieved RGB signature, we calculate a number of vegetation indices that are effective at suppressing this unwanted variation and maximizing the underlying phenological signal. Most important among these is the green chromatic coordinate (GCC), calculated as G<sub>CC</sub> = G<sub>DN</sub> / (R<sub>DN</sub> + G<sub>DN</sub> + B<sub>DN</sub>). The red chromatic coordinate (GCC) is calculated in a similar way.
 
For additional details, see Richardson et al. (2018) Scientific Data, and Richardson (2019) New Phytologist.

PhenoCam data are processed and posted daily and the low latency of the PhenoCam data allows for a unique opportunity to evaluate forecasts in real-time.

Each image has a defined “region of interest’ (ROI).  An ROI is a set of pixels that isolates particular features in the image (i.e., a set of deciduous trees in a mixed forest). The ROI of the below top-of-canopy PhenoCams will be used to assess the forecasts’ accuracy.  The mid-day (noon) mean GCC and GCC standard deviation for the ROI will be used for evaluation.

All data in the supplied file is available to build and evaluate models before submitting a forecast to challenge.  Once new data becomes avialable, the data are appended to the existing file.  Within the challenge scoring, only the new data are used to evaluate previously submitted forecasts.

### Target file

Here is the format of the target file


```r
d <- readr::read_csv("https://data.ecoforecast.org/targets/phenology/phenology-targets.csv.gz", guess_max = 1e6)
```
The target file has the following columns:

- `time`: YYYY-MM-DD    
- `siteID`: NEON site code (e.g., BART)   
- `gcc_90`: 90th percentile GCC for the ROI   
- `gcc_sd`: standard deviation of the 90th percentile   
- `rcc_90`: 90th percentile RCC for the ROI (see Fall Phenology for more information about this variable)
- `rcc_sd`: standard deviation of the 90th percentile (see Fall Phenology for more information about this variable)   

## Timeline

Forecasts for a minimum of 35 days can be submitted daily by 6 pm ET throughout 2022. A minimum of 35 days in the future must be forecasted for each submission. For example, a forecast submitted on February 1 should be for at least February 1st – March 7th, but it could be for the full spring. New forecasts can be submitted daily as new weather forecasts and observations (e.g., PhenoCam) become available. Processed PhenoCam data will be available daily by 11:59 pm ET for each day. The key is that submissions are predictions of the future.

Even that daily submissions are allowed and encouraged as new observations and weather forecasts become avaiable, the automation of forecast generation may be ideal.  There are many ways to automate scripts that are writen to download observations and metreology drivers, generate forecasts, and submit forecasts. Two tools that many have used are cron jobs (see the R package [cronR](https://cran.r-project.org/web/packages/cronR/index.html)){target="_blank"} that execuate tasks at user specificd times and [github actions](https://youtu.be/dMrUlXi4_Bo){target="_blank"}.  See more at [Frequently Asked Questions]    

## Submissions

Instructions for submitting forecasts are found here: [Submission Instructions]

With the specific file format here: [Phenology]

## Meterological inputs for modeling

Information about forecasted meteorology that is available for you to use when generating your forecasts can be found here: [Meteorology Inputs] 

## Useful functions

Functions for validating, evaluating and submitting forecasts can be found here [Helpful Functions]

Functions for downloading and working with the meteorology forecasts can be be found here: [Access EFI snapshots of NOAA forecasts at NEON sites]

## Null models

Two null models are automatically generated each day.  The persistence null model use the most recent measurement of gcc_90 or rcc_90 and predicts that the values will be constant in the future.  The climatology null model futures that the gcc_90 or rcc_90 will be equal to the historical mean of that day of year.

Code for the persistence null model can be found [here](https://github.com/eco4cast/neon4cast-phenology/blob/master/nullModel_randomWalk_main.R){target="_blank}

Code for the climatology null model can be found [here](https://github.com/eco4cast/neon4cast-phenology/blob/master/phenology_climatology.R){target="_blank"}

## FAQ

Answers to frequency asks questions can be found here: [Frequently Asked Questions]

## Design team

Kathryn Wheeler, Boston University   
Min Chen, University of Wisconsin, Madison   
Michael Dietze, Boston University  
David LeBauer, University of Arizona   
Dabasmita Pal, Michigan State University   
Andrew Richardson, Northern Arizona University      
Arun Ross, Michigan State University    
Quinn Thomas, Virginia Tech    
Luke Zachmann, Conservation Science Partners    
Kai Zhu, University of California - Santa Cruz    

## Partners

The challenge is hosted by the Ecological Forecasting Initiative (EFI; https://ecoforecast.org/) and its U.S. National Science Foundation sponsored Research Coordination Network (EFI-RCN; https://ecoforecast.org/rcn/).

Data used in the challenge are collected by the National Ecological Observatory Network (NEON; https://www.neonscience.org/) and hosted by the Phenocam Network (http://phenocam.sr.unh.edu/). 

The forecasting challenge was developed in collaboration with the USA National Phenology Network: https://www.usanpn.org/usa-national-phenology-network.

## References

Richardson, A., Hufkens, K., Milliman, T. et al. Tracking vegetation phenology across diverse North American biomes using PhenoCam imagery. Sci Data 5, 180028 (2018). https://doi.org/10.1038/sdata.2018.28

Richardson, A.D. (2019), Tracking seasonal rhythms of plants in diverse ecosystems with digital camera imagery. New Phytol, 222: 1742-1750. https://doi.org/10.1111/nph.15591
