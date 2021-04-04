# Theme: Phenology

**What**: Terrestrial phenology defined by daily greenness of plants 

**Where**: 8 deciduous broadleaf forest NEON sites in the continental U.S.

**When**: Daily forecasts for 35-days in the future from February 1 - July 1, 2021 with a second round being run for the autumn. Forecast submissions are accepted daily, and later submissions after the February 1 start are permissible.

**Why**: Phenology has been identified as one of the primary ecological fingerprints of global climate change.

**Who**: Open to any individual or team that registers

**How**: [REGISTER](https://nd.qualtrics.com/jfe/form/SV_9MJ29y2xNrBOjqZ) your team and submit forecast

We held a Q&A session on January 27, 2021. You can find a recording from that session [HERE](https://www.youtube.com/watch?v=UwX2IA1vDQE&feature=youtu.be).

## Overview

Phenology has been shown to be a robust integrator of the effects of year-to-year climate variability and longer-term climate change on natural systems (e.g., recent warming trends). Experimental studies have shown how other global change factors (e.g., elevated CO<sub>2</sub> and N deposition) can also influence phenology. There is a need to better document biological responses to a changing world, and improved phenological monitoring at scales from individual organisms to ecosystems, regions, and continents will contribute to achieving this goal.

Phenology researchers often use digital cameras (such as those that are part of the PhenoCam Network) that take regular repeated images of plant canopies to monitor changes in greenness throughout the year. The PhenoCam Network is a cooperative continental-scale phenological observatory that uses digital repeat photography to track vegetation phenology in a diverse range of ecosystems across North America and around the World. Imagery and data are made publicly available in near-real-time through the PhenoCam webpage: http://phenocam.sr.unh.edu/.

## Challenge

This is an open ecological forecasting challenge to forecast spring green-up of the common greenness index (GCC), as measured by digital cameras at various deciduous broadleaf NEON sites. The forecasts will be forecasts of daily mean GCC (specifically the 90% quantile, which has been shown to be more robust). The sites include Harvard Forest (HARV), Bartlett Experimental Forest (BART), Smithsonian Conservation Biology Institute, (SCBI), Steigerwaldt Land Services (STEI), The University of Kansas Field Station, KS (UKFS), Great Smoky Mountains National Park (GRSM), Dead Lake (DELA), and National Grassland (CLBJ).

NOAA Global Ensemble Forecast System weather forecasts for each NEON site is provided for teams to use: https://data.ecoforecast.org/minio/drivers/noaa/

Teams must provide access (minimum of URL, but ideally a script) to any additional data they wish to use to all teams in the challenge. Teams of various career stages and disciplines are encouraged to submit forecasts.

## Data: Targets:

The challenge uses the following NEON data products:

[DP1.00033.001](https://data.neonscience.org/data-products/DP1.00033.001): Phenology images

A file with previously released NEON data that has been processed into “targets” is provided below. The same processing will be applied to new data that are used for forecast evaluation. Before the Phenology challenge begins, a processing script will be available in the [neon4cast-phenology GitHub repository](https://github.com/eco4cast/neon4cast-phenology).

### Green chromatic coordinate (gcc)

**Definition**

The ratio of the green digital number to the sum of the red, green, blue digital numbers from a digital camera

**Motivation**

Quantitative metrics of vegetation color extracted from PhenoCam imagery provide data that are consistent with ground observations of phenology and as well as other conventional vegetation indices across ecosystems. 

### Focal sites

| Site Name       | Site (and PhenoCam) ID     | NEON Domain     | Latitude  |  Longitude | Dominant Species |
| :------------- | :----------: | -----------: | -----------: | -----------: | -----------: |
|  [Harvard Forest, MA](https://www.neonscience.org/field-sites/harv) | NEON.D01.HARV.DP1.00033  | D01: Northeast    | 42.537 | -72.173 | *Quercus rubra*, *Acer rubrum*, *Aralia nudicaulis* | 
|  [Bartlett Experimental Forest, NH](https://www.neonscience.org/field-sites/bart) | NEON.D01.BART.DP1.00033  | D01: Northeast    | 44.0639 | -71.2874 | *Liriodendron tulipifera*, *Microstegium vimineum*, *Juglans nigra* | 
|  [Steigerwaldt Land Services, WI](https://www.neonscience.org/field-sites/stei)  | NEON.D05.STEI.DP1.00033  | D05: Great Lakes | 45.509 | -89.586 | *Populus tremuloides*, *Abies balsamea*, *Acer rubrum* | 
|  [The University of Kansas Field Station, KS](https://www.neonscience.org/field-sites/ukfs) | NEON.D06.UKFS.DP1.00033  | D06: Prairie Peninsula    | 39.040 | -95.192 | *Symphoricarpos orbiculatus*, *Celtis occidentalis*, *Carya ovata* | 
|  [Great Smoky Mountains National Park, TN](https://www.neonscience.org/field-sites/grsm) | NEON.D07.GRSM.DP1.00033  | D07: Appalachians and Cumberland Plateau   | 35.689 | -83.502 | *Liriodendron tulipifera*, *Acer rubrum*, *Acer pensylvanicum* | 
|  [Dead Lake, AL](https://www.neonscience.org/field-sites/dela) | NEON.D08.DELA.DP1.00033  | D08: Ozarks Complex    | 32.542 | -87.804 | *Celtis laevigata*, *Ligustrum sinense*, *Liquidambar styraciflua* | 
|  [National Grassland, TX](https://www.neonscience.org/field-sites/clbj) | NEON.D11.CLBJ.DP1.00033  | D11: Southern Plains    | 33.401 | -97.570 | *Quercus marilandica*, *Schizachyrium scoparium* | 


### Target data calulation

Digital cameras mounted above forests are pointed at the forest canopy.  Images are collected every half hour.

The images are a set of pixels values in red, blue, and blue color channels (RGB).  A pixel value is an 8-bit digital number (DN). Because internal processing (including exposure control) and external factors affecting scene illumination (weather and atmospheric effects) both influence the retrieved RGB signature, we calculate a number of vegetation indices that are effective at suppressing this unwanted variation and maximizing the underlying phenological signal. Most important among these is the green chromatic coordinate (GCC), calculated as GCC = GDN / (RDN + GDN + BDN).
 
For additional details, see Richardson et al. (2018) Scientific Data, and Richardson (2019) New Phytologist.

PhenoCam data are processed and posted daily and the low latency of the PhenoCam data allows for a unique opportunity to evaluate forecasts in real-time.

Each image has a defined “region of interest’ (ROI).  An ROI is a set of pixels that isolates particular features in the image (i.e., a set of deciduous trees in a mixed forest). The ROI of “DB_1000” for the below top-of-canopy PhenoCams will be used to assess the forecasts’ accuracy.  The mid-day (noon) mean GCC and GCC standard deviation for the “DB_1000” ROI will be used for evaluation.

All data in the supplied file is available to build and evaluate models before submitting a forecast to challenge.  Once new data becomes, the data are appended to the existing file.  Within the challenge scoring, only the new data are used to evaluate previously submitted forecasts.

### Target file

- `time`: YYYY-MM-DD
- `statistic`: variable name (“mean” or “sd”)
- `gcc_90`: 
- `siteID`: NEON site code (e.g., BART)

Here is the format of the target file


```r
readr::read_csv("https://data.ecoforecast.org/targets/ticks/ticks-targets.csv.gz", guess_max = 1e6)
```

```
## # A tibble: 3,969 x 21
##     Year epiWeek yearWeek plotID   siteID nlcdClass       decimalLatitude
##    <dbl> <chr>      <dbl> <chr>    <chr>  <chr>                     <dbl>
##  1  2015 37        201537 BLAN_005 BLAN   deciduousForest            39.1
##  2  2015 38        201538 BLAN_005 BLAN   deciduousForest            39.1
##  3  2015 39        201539 BLAN_005 BLAN   deciduousForest            39.1
##  4  2015 40        201540 BLAN_005 BLAN   deciduousForest            39.1
##  5  2015 41        201541 BLAN_005 BLAN   deciduousForest            39.1
##  6  2015 42        201542 BLAN_005 BLAN   deciduousForest            39.1
##  7  2015 43        201543 BLAN_005 BLAN   deciduousForest            39.1
##  8  2015 44        201544 BLAN_005 BLAN   deciduousForest            39.1
##  9  2015 45        201545 BLAN_005 BLAN   deciduousForest            39.1
## 10  2015 46        201546 BLAN_005 BLAN   deciduousForest            39.1
## # … with 3,959 more rows, and 14 more variables: decimalLongitude <dbl>,
## #   elevation <dbl>, totalSampledArea <dbl>, amblyomma_americanum <dbl>,
## #   ixodes_scapularis <dbl>, time <date>, RHMin_precent <dbl>,
## #   RHMin_variance <dbl>, RHMax_precent <dbl>, RHMax_variance <dbl>,
## #   airTempMin_degC <dbl>, airTempMin_variance <dbl>, airTempMax_degC <dbl>,
## #   airTempMax_variance <dbl>
```

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