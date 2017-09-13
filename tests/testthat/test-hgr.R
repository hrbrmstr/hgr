context("basic functionality")
test_that("we can do something", {

  story <- "https://www.nytimes.com/2017/04/18/world/asia/aircraft-carrier-north-korea-carl-vinson.html?hp&action=click&pgtype=Homepage&clickSource=story-heading&module=first-column-region&region=top-news&WT.nav=top-news&_r=0"

  doc <- just_the_facts(story)
  plain <- clean_text(doc$content)

  expect_equal(
    substr(plain, 1, 100),
    "WASHINGTON — Just over a week ago, the White House declared that ordering an American aircraft carri"
  )

})
