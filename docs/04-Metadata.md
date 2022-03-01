# Submission Metadata Generation

The challenge organizer have created tools to assist in generating the metadata that describes a forecast submission

## Team information


```r
team_list <- list(list(individualName = list(givenName = "Quinn", 
                                             surName = "Thomas"),
                       organizationName = "Virginia Tech",
                       electronicMailAddress = "rqthomas@vt.edu"),
                  list(individualName = list(givenName = "Robert", 
                                             surName = "Thomas"),
                       organizationName = "Virginia Tech"))
```

## Model Description 

### Initial conditions

Uncertainty in the initialization of state variables (Y). Initial condition uncertainty will be a common feature of any dynamic model, where the future state depends on the current state, such as population models, process-based biogeochemical pool & flux models, and classic time-series analysis. 

### Drivers

Uncertainty in model drivers, covariates, and exogenous scenarios (X). Driver/covariate uncertainties may come directly from a data product, as a reported error estimate or through driver ensembles, or may be estimated based on sampling theory, cal/val documents, or some other source.

`complexity` = Number of different driver variables or covariates in a model. For example, in a multiple regression this would be the number of X’s. For a climate-driven model, this would be the number of climate inputs (temperature, precip, solar radiation, etc.).

### Parameters

Uncertainty in model parameters (). For most ecological processes the parameters (a.k.a. coefficients) in model equations are not physical constants but need to be estimated from data. 

`complexity` = number of estimated parameters/coefficients in a model at a single point in space/time. For example, in a regression it would be the number of beta’s.

### Random effects

`complexity` = number of random effect terms, which should be equivalent to the number of random effect variances estimated. For example, if you had a hierarchical univariate regression with a random intercept you would have two parameters (slope and intercept) and one random effect (intercept). At the moment, we are not recording the number of distinct observation units that the model was calibrated from. So, in our random intercept regression example, if this model was fit at 50 sites to be able to estimate the random intercept variance, that would affect the uncertainty about the mean and variance but that ‘50’ would not be part of the complexity dimensions.

### Process error

Dynamic uncertainty in the process model attributable to both model misspecification and stochasticity. Pragmatically, this is the portion of the residual error from one timestep to the next that is not attributable to any of the other uncertainties listed above, and which typically propagates into the future. 

`complexity` =  dimension of the error covariance matrix. So if we had a n x n covariance matrix, n is the value entered for `complexity`. Typically n should match the dimensionality of the initial_conditions unless there are state variables where process error is not being estimated or propagated

### Observation error

Uncertainty in the observations of the output variables. Note that many statistical modeling approaches do not formally partition errors in observations from errors in the modeling process, but simply lump these into a residual error. Because of this we make the pragmatic distinction and ask that residual errors that a forecast model do not directly propagate into the future be recorded as  observation errors. Observation errors now may indeed affect the initial condition uncertainty in the next forecast, but we consider this to be indirect. 

`complexity` = dimension of the error covariance matrix. So if we had a n x n covariance matrix, n is the value entered for `complexity`. Typically n should match the dimensionality of the initial_conditions unless there are state variables where process error is not being estimated or propagated

### Progation

`propogation` = method for generating uncertainty in the model predictions to represent uncertainty in initial conditions

### assimilation

`assimilation` = how data is used to estimate the uncertainty in initial conditions

## Example R "list"


```r
model_metadata = list(
  forecast = list(
    model_description = list(
      forecast_model_id =   # model identifier:
      name =  #Name or short description of model
      type =  #General type of model empirical, machine learning, process
      repository =  # put your GitHub Repository in here
    ),
    initial_conditions = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = , #How many models states need initial conditions; delete if status = absent
     #Delete list below if status = absent, present, or data_driven
      propagation = list(
        type =  , #How does your model propogate initial conditions ('ensemble' is most common)
        size =  #number of ensemble members
      ),
      #Delete list below UNLESS status = assimilates
      assimilation = list(
        type = , #description of assimilation method
        reference = , #reference for assimilation method
        complexity =  #number of states that are updated with assimilation
      )
    ),
    drivers = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = , #How many drivers are used? Delete if status = absent
      #Delete list below if status = absent, present, or data_driven
      propagation = list( 
        type = , #How does your model propogate driver (ensemble or MCMC is most common
        size = #number of ensemble or MCMC members
        ) 
    ),
    parameters = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = , #How many parameters are included?; Delete if status = absent
      #Delete list below below blank if status = absent, present, or data_driven
      propagation = list(
        type = , #how does your model propogate parameter uncertainity?
        size = ),
      #Delete list below UNLESS status = assimilates  
      assimilation = list(
        type = , #description of assimilation method
        reference = , #reference for assimilation method
        complexity =  #number of states that are updated with assimilation
      )
    ),
    random_effects = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = ,  #Delete if status = absent
      #Delete list below if status = absent, present, or data_driven
      propagation = list(
        type = , #How does your model propogate random effects (ensemble or MCMC is most common)
        size =  #number of ensemble or MCMC members
      ),
      #Delete list below NLESS status = assimilates
      assimilation = list(
        type = , #description of assimilation method
        reference = , #reference for assimilation method
        complexity =  #number of states that are updated with assimilation
      )
    ),
    process_error = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = , #Delete if status = absent
      #Delete the list below below blank if status = absent, present, or data_driven
      propagation = list(
        type = , #How does your model propagate random effects uncertainty (ensemble or MCMC is most common) 
        size =  #How many ensemble or MCMC members
      ),
      #Delete the list below UNLESS status = assimilates
      assimilation = list(
        type = , #Name of data assilimilation method
        reference = , #Reference for data assimilation method
        complexity = , #Number of states assimilate
        covariance = , #TRUE OR FALSE
        localization =  #TRUE OR FALSE
      )
    ),
    obs_error = list(
      status = , #options: absent, present, data_driven, propagates, assimilates
      complexity = , #Delete if status = absent
      #Delete the list below below blank if status = absent, present, or data_driven
      propagation = list(
        type = , #How does your model propagate random effects uncertainty (ensemble or MCMC is most common) 
        size =  #How many ensemble or MCMC members
      )
    )
  )
)
```

The metadata XML can be generated using the the `forecast_file` (path and filename of forecast), `team_list` (see above), and `mode1_metadata` (see above).  The `neon4cast::generate_metadata()` function will take this information add additional metdata to complete the XML.  The `forecast_file` must following the format described at [Forecast format]


```r
neon4cast::generate_metadata(forecast_file, team_list, model_metadata)
```

## Example

Below is an example of the `model_metadata` for the terrestrial daily climatology model.  It is a simple model that forecasts the carbon exchange (NEE) and evaporation (LE) is equal to the mean and standard deviation of the historical data for that day-of-year.  Since it is a simple model, many of the descriptions of model uncertainty are `absent`.   


```r
model_metadata = list(
  forecast = list(
    model_description = list(
      forecast_model_id =  "climatology", 
      name = "Day-of-year mean", 
      type = "empirical",  
      repository = "https://github.com/eco4cast/neon4cast-terrestrial/blob/master/03_terrestrial_flux_daily_null.R" 
    ),
    initial_conditions = list(
      status = "absent"
    ),
    drivers = list(
      status = "absent"
    ),
    parameters = list(
      status = "absent"
    ),
    random_effects = list(
      status = "absent"
    ),
    process_error = list(
      status = "data_driven",
      complexity = 2
    ),
    obs_error = list(
      status = "absent"
    )
  )
)
```


