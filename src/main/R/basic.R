
# wildcard select on field
r = tt[grep("user", tt$V1), ]

# wildcard select on field with NOT
t = setdiff(seq(length(tt$V1)),grep("user", tt$V1))
r = tt[t, ]

# numeric select on field
r = tt[tt$runtime < 5, ]

# numeric select on field with NOT
r = tt[!tt$runtime < 15, ]