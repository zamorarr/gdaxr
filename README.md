[![Travis-CI Build Status](https://travis-ci.org/zamorarr/gdaxr.svg?branch=master)](https://travis-ci.org/zamorarr/gdaxr)
[![Coverage Status](https://img.shields.io/codecov/c/github/zamorarr/gdaxr/master.svg)](https://codecov.io/github/zamorarr/gdaxr?branch=master)
 
## Overview 
**gdaxr** provides an R interface for making requests to the GDAX API.
This package is still under development and not all endpoints have been 
implemented yet. 

Please see the official [GDAX API reference](https://docs.gdax.com/) for more information on the web API.

## Example usage
```R
library(gdaxr)
accounts <- gdax_get("accounts")

# look at first account
accounts[[1]]
```

## Installation and Setup
Installation can be done via devtools.

```R
devtools::install_github("zamorarr/gdaxr")
```

## API Authentication
API key authentication requires each request to be signed. You can create and activate new API keys in your [GDAX API settings](https://www.gdax.com/settings/api).

This package assumes you have set your `GDAX_KEY`, `GDAX_SECRET`, and 
`GDAX_PASSPHRASE` environment variables to the values provided when you created 
a new API key. Please ensure these are set in your ~/.Renviron file and check with

```R
Sys.getenv("GDAX_KEY")
Sys.getenv("GDAX_SECRET")
Sys.getenv("GDAX_PASSPHRASE")
```
