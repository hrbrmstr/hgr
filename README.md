
`hgr` : Tools to Work with the 'Postlight' 'Mercury' 'API'

Mercury takes any web article and returns only the relevant content — headline, author, body text, relevant images and more — free from any clutter. You need an API key which you can get from [here](https://mercury.postlight.com).

The following functions are implemented:

-   `just_the_facts`: Retrieve parsed content of a URL processed by the Postlight Mercury API
-   `clean_text`: Remove all HTML/XML tags from an HTML document/atomic character vector

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

    ## [1] '0.3.0'

``` r
story <- "https://www.nytimes.com/2017/04/18/world/asia/aircraft-carrier-north-korea-carl-vinson.html?hp&action=click&pgtype=Homepage&clickSource=story-heading&module=first-column-region&region=top-news&WT.nav=top-news&_r=0"

doc <- just_the_facts(story)

dplyr::glimpse(doc)
```

    ## List of 12
    ##  $ title         : chr "Aircraft Carrier Wasn’t Sailing to Deter North Korea, as U.S. Suggested"
    ##  $ content       : chr "<div><article id=\"story\" class=\"story theme-main   \">\n\n    \n\n                        \n    \n\n    \n\n"| __truncated__
    ##  $ author        : chr "Mark Landler and Eric Schmitt"
    ##  $ date_published: POSIXct[1:1], format: "2017-04-18 17:57:41"
    ##  $ lead_image_url: chr "https://static01.nyt.com/images/2017/04/19/world/19carrier-sub/19carrier-sub-facebookJumbo.jpg"
    ##  $ url           : chr "https://www.nytimes.com/2017/04/18/world/asia/aircraft-carrier-north-korea-carl-vinson.html"
    ##  $ domain        : chr "www.nytimes.com"
    ##  $ excerpt       : chr "The saga might never have come to light had the Navy not posted a photograph of the Carl Vinson sailing through"| __truncated__
    ##  $ word_count    : int 1499
    ##  $ direction     : chr "ltr"
    ##  $ total_pages   : int 1
    ##  $ rendered_pages: int 1
    ##  - attr(*, "row.names")= int 1
    ##  - attr(*, "class")= chr "hgr"

``` r
substr(doc$content, 1, 100)
```

    ## [1] "<div><article id=\"story\" class=\"story theme-main   \">\n\n    \n\n                        \n    \n\n    \n\n  "

``` r
plain <- clean_text(doc$content)

substr(plain, 1, 100)
```

    ## [1] "WASHINGTON — Just over a week ago, the White House declared that ordering an American aircraft carri"

### Test Results

``` r
library(hgr)
library(testthat)

date()
```

    ## [1] "Wed Sep 13 14:44:54 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 1 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================
