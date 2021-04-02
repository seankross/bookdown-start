# Theme: Beetle Communities

**What:** Beetle abundance and species richness from the National Ecological Observatory Network

**Where:** 47 terrestrial NEON sites that span the diverse ecosystems of the U.S.

**When:** Weekly forecasts for 20 months in the future starting June 30-December 31, 2021; later submissions after the June 30 start are permissible

**Why:** Improve understanding of habitat quality, conservation potential, land-use sustainability, and biodiversity change in response to global change and ecological disturbances

**Who**: Open to any individual or team that registers

**How**: REGISTER your team and submit forecast

## Overview

Biodiversity monitoring is critical for understanding environmental quality, evaluating the sustainability of land-use practices, and forecasting future impacts of global change on ecosystems. Sentinel species give forewarning of environmental risk to humans, so are particularly useful for such monitoring and forecasting efforts because they can provide surrogates for other co-located components of biodiversity (Sauberer et al. 2004). 

Ground beetles (Family: Carabidae) are appropriate candidates for biodiversity monitoring and ecological forecasting as they are well-studied sentinel species that are geographically widespread, and their community dynamics are particularly congruent with the diversity of other invertebrates (Holland 2002; Lundgren & McCravy 2011; Bousquet 2012; Hoekman et al. 2017). Therefore, monitoring carabid communities and forecasting changes in their species richness and abundance can be useful in studying edge effects and habitat quality (Magura 2002), conservation potential (Butterfield 1995), land-use sustainability (Pearce & Venier 2006) and biodiversity change in response to global change and ecological disturbances (Koivula 2011). Most ecological forecasting models are limited in the geographic scale and also suffer from scarcity of temporally extensive data. Further, most existing forecasting efforts focus on a single species (Humphries et al. 2018) with limited community-wide forecasts at the continental scale. Developing forecasts for community-scale metrics (i.e., species richness, abundance) and evaluating such models for accuracy and generalizability can help test our scientific knowledge of spatial (geographical turnover) and temporal (seasonal, inter-annual) carabid community dynamics (Dietze et al. 2018). Such forecasting models can inform regional or local habitat management, identify where biodiversity monitoring efforts should be prioritized, and shed light on what data or modelling techniques are needed to build the best forecasts of ecological dynamics (e.g., can we predict richness or abundance better and why?) (Johansson et al. 2019). 

With the long-term, community-wide, continental-scale data collection through the National Ecological Observatory Network (NEON), 181 data products are available for 81 sites in the US (47 terrestrial, at which carabids are sampled, and 34 aquatic). Fully initiated in 2019, this sampling will continue for 30 years (Schimel et al. 2007; 2011). NEON has effectively removed the previous barriers to community-scale forecasting across a broader geographical realm. 

## Challenge 

This is an open ecological forecasting challenge to forecast carabid species richness, defined as the total number of species, and abundance, defined as the total number of carabid individuals. The forecasts should be done weekly per site for all NEON terrestrial sites with richness being absolute and abundance scaled by the sampling effort. Contributing teams are required to submit a forecast for May-Dec 2021 and Jan-Dec 2022 on June 30, 2021. However, teams are encouraged to update their forecasts on the last day of each month, ending on December 31, 2021, as NEON validation data are released. NEON releases carabid sampling data weekly and no sooner than 60 days after collection, so a model submitted on June 30 can include a forecast for the first week of May, and so forth. Teams may use any open data products as drivers of richness and abundance so long as they are not from the month being forecast, and are made publicly available (minimum of URL, but ideally a script). Potential driver data sources include: NEON site data (Soil and sediment data, Terrestrial Plant data, weather data), NOAA forecasts, and beyond. 

Submissions of forecast and metadata will be through https://data.ecoforecast.org/minio/submissions/ using prescribed file formats described in the challenge theme documentation (PENDING).

Forecasts will be scored and compared using the Continuous Ranked Probability Score, a metric that combines accuracy and uncertainty estimation (Gneiting, T., & Raftery, A. E., 2007). Only weeks for which data are collected will be included in scoring. 

## Data: Training and Evaluation:

The challenge uses the following NEON data product:
DP1.10022.001: Ground beetles sampled from pitfall traps

## Data: Targets

A file with previously released NEON data that has been processed into the aggregate “target” variables (richness and abundance) is provided below. The same processing will be applied to new data that are used for forecast evaluation. Further information about data structure, initial code for processing, and example null forecasts is provided in the neon4cast-beetles GitHub repository. 

## Detailed protocol 

Details of the targets, how they are calculated, descriptions of the target files, and examples of other environmental variables that could be used in the Challenge are HERE. 

Access Targets HERE

Download an example of a forecast output format for submission HERE

## Timeline

The timeline is determined by the data latency provided by NEON. NEON carabid pitfall trap data is released weekly with a latency of at least 60 days after collection. Weekly forecasts were chosen to best match up with NEON’s weekly release of carabid data. 

The challenge will begin June 30, 2021 at 11:59 Eastern Standard Time (UTC−05:00) and run through December 31, 2021. Subsequent forecasts are due at 11:59 EST on the final day of each month.

As an example, carabid pitfall trap data released in the last week of June would include data as recent as the last week of April. Thus, a model submitted in the last week of June could include forecasts from May onwards. Then, the forecast update submitted at the end of July can use new May data to help refine June forecasts, or forecasts following June, depending on what drivers are used. The July forecast update is due by 11:59 pm EST on July 31. Forecasts updates will not be considered for weeks where NEON validation data has already been released (i.e., no May forecast updates may be submitted on July 31) or for weeks when no NEON carabid data is available. 

![](images/June2021_Calendar.jpg)
![](images/July2021_Calendar.jpg)
Pitfall traps are collected and reset every 2 weeks throughout the growing season. Due to weather and conditions beyond the field team’s control, this collection schedule may not be followed. Thus, the exact collection dates cannot be known until they have happened. Field data are made publicly available on the data portal as the bet_fielddata dataframe no sooner than 14 days after collection. Teams can use bet_fielddata to inform the actual collection schedule. Data with parataxonomist identifications are made publicly available on the data portal as the bet_sorting dataframe no sooner than 60 days after collection. Data are released on the NEON data portal weekly, but may be released on any day of the week. The forecast schedule follows the ISO week standard with weeks starting on Mondays.

## Design team

Anna Spiers, University of Colorado, Boulder  
Carl Boettiger, University of California, Berkeley  
Tad Dallas, Louisiana State University  
Nico Franz, NEON Biorepository at Arizona State University  
Kari Norman, University of California, Berkeley  
Thilina Surasinghe, Bridgewater State University  
Brett Melbourne, University of Colorado, Boulder  
Eric Sokol, NEON  
Kelsey Yule, NEON Biorepository at Arizona State University  

## Partners

The challenge is hosted by the Ecological Forecasting Initiative (EFI; https://ecoforecast.org/) and its U.S. National Science Foundation sponsored Research Coordination Network (EFI-RCN; https://ecoforecast.org/rcn/).

Data used in the challenge from National Ecological Observatory Network (NEON): https://www.neonscience.org/. 

## References

Bousquet, Y. (2012) Catalogue of Geadephaga (Coleoptera: Adephaga) of America, north of Mexico. ZooKeys 245: 1-1722. https://doi.org/10.3897/zookeys.245.3416

Butterfield, J., Luff, M., Baines, M., Eyre, M. (1995) Carabid beetle communities as indicators of conservation potential in upland forests. Forest Ecology and Management 79, 63-77. 
https://doi.org/10.1016/0378-1127(95)03620-2

Dietze, M.C., Fox, A., Beck-Johnson, L.M., Betancourt, J.L., Hooten, M.B., Jarnevich, C.S., Keitt, T.H., Kenney, M.A., Laney, C.M., Larsen, L.G. (2018) Iterative near-term ecological forecasting: Needs, opportunities, and challenges. Proceedings of the National Academy of Sciences 115, 1424-1432. https://doi.org/10.1073/pnas.1710231115

Gneiting, T., & Raftery, A. E. (2007). Strictly proper scoring rules, prediction, and estimation. Journal of the American Statistical Association, 102(477), 359–378. https://doi.org/10.1198/016214506000001437

Hoekman, D., LeVan, K.E., Gibson, C., Ball, G.E., Browne, R.A., Davidson, R.L., Eriwin, T.L., Knisley, C.B., LaBonte, J.R., Lundgren, J., Maddison, D.R., Moore, W., Niemela, J., Ober, K.A., Pearson, D.L. Spence, J.R., Will, K., Work, T. (2017) Design for ground beetle abundance and diversity sampling within the National Ecological Observatory Network. Ecosphere, 8(4), e01744. https://doi.org/10.1002/ecs2.1744

Holland, J.M. (2002) The agroecology of carabid beetles. Intercept Limited, Andover.

Humphries, G.R., Che-Castaldo, C., Bull, P., Lipstein, G., Ravia, A., Carrión, B., Bolton, T., Ganguly, A., Lynch, H.J. (2018) Predicting the future is hard and other lessons from a population time series data science competition. Ecological Informatics 48, 1-11. https://doi.org/10.1016/j.ecoinf.2018.07.004

Johansson, M.A., Apfeldorf, K.M., Dobson, S., Devita, J., Buczak, A.L., Baugher, B., Moniz, L.J., Bagley, T., Babin, S.M., Guven, E. (2019) An open challenge to advance probabilistic forecasting for dengue epidemics. Proceedings of the National Academy of Sciences 116, 24268-24274. https://doi.org/10.1073/pnas.1909865116

Koivula, M.J. (2011) Useful model organisms, indicators, or both? Ground beetles (Coleoptera, Carabidae) reflecting environmental conditions. ZooKeys, 287-317. https://doi.org/10.3897/zookeys.100.1533

Lundgren, J., McCravy, K. (2011) Carabid beetles (Coleoptera: Carabidae) of the Midwestern United States: A review and synthesis of recent research. Terrestrial arthropod reviews 4, 63-94. https://doi.org/10.1163/187498311X565606

Magura, T. (2002) Carabids and forest edge: spatial pattern and edge effect. Forest Ecology and Management 157, 23-37. https://doi.org/10.1016/S0378-1127(00)00654-X

Pearce, J.L., Venier, L.A. (2006) The use of ground beetles (Coleoptera: Carabidae) and spiders (Araneae) as bioindicators of sustainable forest management: A review. Ecological Indicators 6, 780-793. https://doi.org/10.1016/j.ecolind.2005.03.005

Sauberer, N., Zulka, K.P., Abensperg-Traun, M., Berg, H.-M., Bieringer, G., Milasowszky, N., Moser, D., Plutzar, C., Pollheimer, M., Storch, C. (2004) Surrogate taxa for biodiversity in agricultural landscapes of eastern Austria. Biological Conservation 117, 181-190. https://doi.org/10.1016/S0006-3207(03)00291-X

Schimel, D., Hargrove, W., Hoffman, F., MacMahon, J. (2007) NEON: a hierarchically designed national ecological network. Frontiers in Ecology and the Environment 5, 59-59. https://doi.org/10.1890/1540-9295(2007)5[59:NAHDNE]2.0.CO;2

Schimel, D., Keller, M., Berukoff, S., Hufft, R., Loescher, H., Powell, H., Kampe, T., Moore, D., Gram, W. (2011) NEON Science Strategy: Enabling Continental-Scale Ecological Forecasting. https://www.neonscience.org/sites/default/files/basic-page-files/NEON_Strategy_2011u2_0.pdf
