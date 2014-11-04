require(stringr)

#search=" source=test_curl_imageserver_ams1.log url=*images*  time_total<2 "
#print(search)

splitSearchIntoToken = function(search){
	search = str_trim(search)
	search =str_replace_all(search, "\\s{2,}", " ")
	print(search)
	w = strsplit(search, " ")
	w=unlist(w)
	print("Search query as token:")
	print(w)
	return(w)
}

getSourceName = function(w){
  sourcename =""
  for(x in w){
    print(x)
    if(grepl("source*",x)){
        x = strsplit(w, "=")
        x=unlist(x)
        x=x[2]
        return(x)
    }
  }
  return(sourcename)
}


loadSource = function(sourcename){
  locale_origin=Sys.getlocale("LC_TIME")
  Sys.setlocale("LC_TIME","en_US.utf8")
  data = read.csv(sourcename, sep=";")
  b$ddate = strptime(b$date ,"%a %b %d %T CET %Y")
  Sys.setlocale(locale_origin)
}


#sourcename= getSourceName(w)
#print(sourcename)
#data = loadSource(sourcename)
# transform token to parameter
#w1 = strsplit(w[2], "<")
#w1=unlist(w1)
#print("X:")
#print(w1)

#data = read.csv("test_curl_imageserver_ams1.log", sep=";")
#r = data[data[,c(w1[1])] < w1[2], ]
