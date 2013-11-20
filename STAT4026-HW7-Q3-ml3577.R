printf <- function(...)print(sprintf(...))


#Q3.a
lines = readLines('~/Downloads/stat4026-speech.txt')
#3.b
grep('\\*\\*\\*',lines)
l = grep('\\*\\*\\*',lines)
stars = lines[l]
print('All stars are listed as follows')
print(stars)
#3.c
a <- lines[l+4]
l = grep('.*, [1-2][0-9]+',a); b = a[l]
dates = b
print('All dates are listed as follows')
print(dates)
#3.d
m <- regexpr("[0-2][0-9][0-9][0-9]", b); 
years = regmatches(b,m)
print('All years are listed as follows')
print(years)
#3.e
n <- regexpr("[A-Z][a-z]+", b); 
months = regmatches(b,n)
print('All months are listed as follows')
print(months)
#3.f



