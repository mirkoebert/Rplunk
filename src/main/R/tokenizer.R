library(stringr)

splitSearchIntoToken = function(search){
	search = str_trim(search)
	search =str_replace_all(search, "\\s{2,}", " ")
	search =str_replace_all(search, "\\s\\=", "=")
	search =str_replace_all(search, "\\=\\s", "=")
    search =str_replace_all(search, "\\s<", "<")
    search =str_replace_all(search, "<\\s", "<")
    search =str_replace_all(search, "\\s>", ">")
    search =str_replace_all(search, ">\\s", ">")
	w = strsplit(search, " ")
	w=unlist(w)
	return(w)
}

getSourceNameFromSearchTokenList = function(w){
  for(x in w){
    print(x)
    if(grepl("source*",x)){
        x = strsplit(w, "=")
        x=unlist(x)
        x=x[2]
        return(x)
    }
  }
  return("")
}


loadSource = function(sourcename){
  	#locale_origin=Sys.getlocale("LC_TIME")
  	#Sys.setlocale("LC_TIME","en_US.utf8")
  	data = read.csv(sourcename, sep=";")
  	#data$ddate = strptime(b$date ,"%a %b %d %T CET %Y")
  	#Sys.setlocale(locale_origin)
	return(data)
}

selectNumeric = function(data, selectToken){
	return(data)
}
