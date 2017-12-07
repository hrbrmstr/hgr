
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/hgr.svg?branch=master)](https://travis-ci.org/hrbrmstr/hgr)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/hgr?branch=master&svg=true)](https://ci.appveyor.com/project/hrbrmstr/hgr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/hrbrmstr/hgr/master.svg)](https://codecov.io/github/hrbrmstr/hgr?branch=master)

# hgr

Tools to Work with the ‘Postlight’ ‘Mercury’ ‘API’

## Description

The ‘Postlight’ ‘Mercury’ ‘API’ <https://mercury.postlight.com> takes
any web article and returns only the relevant content - headline,
author, body text, images and more - free from any clutter and including
only minimal markup. Tools are provided to access the ‘API’ and also
further clean up retrieved text through the the application of ‘XSLT’
style sheets. An ‘RStudio’ ‘Addin’ is also provided which makes it
possible to preview the cleaned content from a ‘URL’ on the clipboard.

You need an API key which you can get from
[here](https://mercury.postlight.com).

## What’s inside the tin?

The following functions are implemented:

  - `just_the_facts`: Retrieve parsed content of a URL processed by the
    Postlight Mercury API
  - `clean_text`: Remove all HTML/XML tags from an HTML document/atomic
    character vector

## Installation

``` r
devtools::install_github("hrbrmstr/hgr")
```

## Usage

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

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
