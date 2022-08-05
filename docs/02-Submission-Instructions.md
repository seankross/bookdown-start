# Submission Instructions

The following provides the requirements for the format of the forecasts that will be submitted. It is important to follow these format guidelines in order for your submitted forecasts to pass a set of internal checks that allow the forecast to be visualized on the [NEON Ecological Forecast Challenge dashboard](http://shiny.ecoforecast.org/){target="_blank"} and evaluated with the scoring process.


## Forecast format

Teams will submit their forecasts as a single netCDF or csv file with the following naming convention (**the correct naming convention is critical for the automated processing of submissions**):

`theme_name-year-month-day-team_name_ID.csv`

or

`theme_name-year-month-day-team_name_ID.nc`

Where `year`, `month`, and `day` are the year, month, and day for the first day of the submitted forecast and the `team_name_ID` is the code for the team name that is specified in the registration (`team_name_ID` is a 10 character name with no spaces in it). 

The `theme_name` options are: `terrestrial_daily`, `terrestrial_30min`, `aquatics`, `beetles`, `ticks`, or `phenology`. 

Forecast netCDF or csv files should have the following columns (csv) or variables (netcdf) that correspond to the columns.

There are two key options for the format.  First, the file can be either in a csv or a netcdf format. Second the file can represent uncertainty using an `ensemble` column or both a `family` and `parameter` column.  The ensemble column uses an integer to individual each ensemble member or MCMC member that represent forecast uncertainty.  The `family` column uses the words `normal` to designate a normal distribution and the parameter column must have values of `mean` and `sd` for each forecasted variable, site_id, and time.

**Note for those using netCDF option**, the order of dimensions on forecast variables should be: `time`, `site`, and `ensemble`.  The netcdf format should only be used for ensemble-based forecasts.

### Examples of the forecast file format. 

**The correct file format is critical for the automated processing of submissions**

### Ensemble CSV

- `time`: The start of the forecast
- `site_id`: NEON code for site
- `ensemble` integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample);
- `variable`: standardized variable name from the theme
- `predicted`: forecasted value

The time unit (i.e., date or date-time) should correspond to the time unit of the theme specific target file

### Distribution CSV

- `time`: The start of the forecast
- `site_id`: NEON code for site
- `family` name of probability distribution that is described by the parameter values in the parameter column; only `normal` is currently allowed
- `parameter` required to be the string `mean` or `sd` (see note below about statistic column).     
- `variable`: standardized variable name from the theme
- `predicted`: forecasted value for mean or standard deviation

The time unit (i.e., date or date-time) should correspond to the time unit of the theme specific target file

### Netcdf

A netcdf should have the following variables 

- `time`: The start of the forecast
- `site_id`: NEON code for site
- `ensemble` integer value for forecast replicate within the year and month (i.e. ensemble member or MCMC sample);

and include additional variables with names that correspond to the theme-specific standardized variables.  For example, a netcdf from the aquatics theme would have `temperature`, `oxygen`, and `chla` variables.  

The order of dimensions on forecast variables should be: `time`, `site`, and `ensemble`.  The netcdf format should only be used for ensemble-based forecasts.

The time unit (i.e., date or date-time) should correspond to the time unit of the theme specific target file

## Metadata format

Each submission requires a metadata file to be submitted. The metadata file must have the same name as the submitted forecast, but with the .xml extension.  

`theme_name-year-month-day-team_name_ID.xml`

Metadata files should be uploaded with the forecast files.

The [metadata standard](https://github.com/eco4cast/EFIstandards){target="_blank"}  has been designed by the Ecological Forecasting Initiative and is built off the widely used Ecological Metadata Language (EML).

To help support metadata generation, we have created a function in the neon4cast package (`generate_metadata()`) and a guide for completing the metadata: [Metadata]

The license for the forecast output is required to be from the following Creative Commons License options: CC BY, CC BY-SA, CC BY-NC, CC BY-NC-SA. While we recommend a CC BY license, teams may use less permissive CC licenses if more appropriate. The license entry can be the CC option (i.e., CC BY) and a web link to the full CC license (e.g., https://creativecommons.org/licenses/by/4.0/)

We recommend teams read the full metadata standard description for definitions and more information, and in particular that they look at the [example vignettes](https://github.com/eco4cast/EFIstandards/tree/master/vignettes){target="_blank"}, which demonstrate the standard being used. Note that these Standards are a work in progress. If you find issues as you are applying them, let us know at **eco4cast.initaitive@gmail.com**.

## Submission process

Individual forecast (csv, netCDF) and metadate (xml) files can be uploaded any time before the specific deadlines as defined by each theme. Only the most recent files will be scored. 

**The correct file name and format is critical for the automated processing of submissions**

Teams will submit their forecast netCDF or csv files manually through the challenge website or with an R script. 

We have developed a function called submit in the `neon4cast` package handles submission process.


```r
neon4cast::submit(forecast_file = "theme_name-forecast-year-month-day-team_name.csv",
                  metadata = "theme_name-year-month-day-team_name.xml")
```

Alternatively, if you using another programming language, you can submit to `neon4cast-submissions` bucket at the `data.ecoforecast.org` endpoint.

Submissions need to adhere to the forecast format that is provided above, including the file naming convention. Our cyberinfastructure automatically evaluates forecasts and relies on the expected formatting. Contact eco4cast.initiative@gmail.com if you experience technical issues with submitting.

**Note:** If you have used AWS in the past you might have credential files in an .aws folder in your home directory that will cause an error when you try to upload to a non-AWS bucket. If you encounter this error you may need to rename your credentials files so put_object doesn't try to read them.

## Validating submission

You can check the status of your submission using the following function in the `neon4cast` package


```r
neon4cast::check_submission("phenology-2022-02-07-persistence.nc")
```

A successful submission can be found at the following links within 2 hours of submissions

We run a validator script when processing the submissions. If your submission does not meet the file standards above, you can run a function that provides information describing potential issues.  The forecast file needs to be in your local working directory or you need to provide a full path to the file


```r
neon4cast::forecast_output_validator("phenology-2022-02-07-persistence.nc")
```

## Visualizing submissions

Plots of submissions and table of scores can be found at our [dashboard](https://shiny3.ecoforecast.org){target="_blank"} 

## Video Describing How to Submit to the Challenge

This video was recorded for the [2021 Early Career Annual Meeting](https://ecoforecast.org/ecological-forecasting-early-career-annual-meeting/){target="_blank"}

<iframe width="560" height="315" src="https://www.youtube.com/embed/S8x5rLtltDU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
