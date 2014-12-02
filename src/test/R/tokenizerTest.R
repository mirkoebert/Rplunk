#! /usr/local/bin/Rscript --vanilla

source("src/main/R/tokenizer.R")
library("testthat")


test_that("Single Source Name", {
	s=getSourceNameFromSearchTokenList("source=test_curl_imageserver_ams1.log")
	expect_that(s,equals("test_curl_imageserver_ams1.log"))
	s=getSourceNameFromSearchTokenList("")
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

test_that("Load data from file", {
	d=loadSource(paste0("src/test/R/test_curl_imageserver_ams1.log"))
	expect_that(dim(d)[1],equals(3923))
	expect_that(dim(d)[2],equals(9))
})


test_that("Select numeric", {
    d=loadSource(paste0("src/test/R/test_curl_imageserver_ams1.log"))
    r=selectNumeric(d,"time_nslookup<0.2");
    expect_that(dim(r)[1],equals(3619))
})  

test_that("Simple load and select", {
    r=search("source=src/test/R/test_curl_imageserver_ams1.log time_nslookup<0.2")
    expect_that(dim(r)[1],equals(3619))
})

