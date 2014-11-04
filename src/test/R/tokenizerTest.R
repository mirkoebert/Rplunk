#! /usr/bin/Rscript --vanilla

source("src/main/R/tokenizer.R")
library("testthat")


test_that("Single Source Name", {
	s=getSourceName("source=test_curl_imageserver_ams1.log")
	expect_that(s,equals("test_curl_imageserver_ams1.log"))
})
