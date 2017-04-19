
`hgr` : Tools to Work with the 'Postlight' 'Mercury' 'API'

Mercury takes any web article and returns only the relevant content — headline, author, body text, relevant images and more — free from any clutter.

The following functions are implemented:

-   `just_the_facts`: Retrieve parsed content of a URL processed by the Postlight Mercury API

### Installation

``` r
devtools::install_github("hrbrmstr/hgr")
```

### Usage

``` r
library(hgr)

# current verison
packageVersion("hgr")
```

    ## [1] '0.1.0'

``` r
story <- "https://www.nytimes.com/2017/04/18/world/asia/aircraft-carrier-north-korea-carl-vinson.html?hp&action=click&pgtype=Homepage&clickSource=story-heading&module=first-column-region&region=top-news&WT.nav=top-news&_r=0"

dplyr::glimpse(just_the_facts(story))
```

    ## Observations: 1
    ## Variables: 12
    ## $ title          <chr> "Aircraft Carrier Wasn’t Sailing to Deter North Korea, as U.S. Suggested"
    ## $ content        <chr> "<div><article id=\"story\" class=\"story theme-main   \">\n\n    \n\n                      ...
    ## $ author         <chr> "Mark Landler and Eric Schmitt"
    ## $ date_published <chr> "2017-04-18T17:57:41.000Z"
    ## $ lead_image_url <chr> "https://static01.nyt.com/images/2017/04/19/world/19carrier-sub/19carrier-sub-facebookJumbo....
    ## $ url            <chr> "https://www.nytimes.com/2017/04/18/world/asia/aircraft-carrier-north-korea-carl-vinson.html"
    ## $ domain         <chr> "www.nytimes.com"
    ## $ excerpt        <chr> "The saga might never have come to light had the Navy not posted a photograph of the Carl Vi...
    ## $ word_count     <int> 1505
    ## $ direction      <chr> "ltr"
    ## $ total_pages    <int> 1
    ## $ rendered_pages <int> 1

### Test Results

``` r
library(hgr)
library(testthat)

date()
```

    ## [1] "Wed Apr 19 10:16:35 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 0 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
