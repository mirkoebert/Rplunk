#! /usr/bin/Rscript --vanilla

source("src/main/R/tokenizer.R")
library("testthat")


test_that("Single Source Name", {
	s=getSourceName("source=test_curl_imageserver_ams1.log")
	expect_that(s,equals("test_curl_imageserver_ams1.log"))
	s=getSourceName("")
    expect_that(s,equals(""))

})

test_that("Search Tokinzing", {
    s=splitSearchIntoToken("    source=test_curl_imageserver_ams1.log url=*images*   time_total<2             ")
    expect_that(s[1],equals("source=test_curl_imageserver_ams1.log"))
	expect_that(s[2],equals("url=*images*")) 
	expect_that(s[3],equals("time_total<2"))  
	
	s=splitSearchIntoToken("    source = test_curl_imageserver_ams1.log url=*images*   time_total < 2             ")
    expect_that(s[1],equals("source=test_curl_imageserver_ams1.log"))
    expect_that(s[2],equals("url=*images*"))
    expect_that(s[3],equals("time_total<2"))
})
