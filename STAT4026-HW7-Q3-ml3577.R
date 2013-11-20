printf <- function(...)print(sprintf(...))

isDates <- function(lines){
	## return a list of true/false list
	return(grepl('.*, [1-2][0-9]+', lines))
}


find_linenumbers_match_3stars <- function(lines){
	## return line numbers containing 3 stars
	star_lineNum = grep('\\*\\*\\*',lines)
	star_lineNum = star_lineNum[isDates(lines[star_lineNum + 4])]
	return(star_lineNum)
}



#Q3.a
lines = readLines('stat4026-speech.txt')
#3.b
star_lines = find_linenumbers_match_3stars(lines)
print('All stars are listed at the following lines')
print(star_lines)
readline('Press enter to continue: ')
#3.c
date_lines <- star_lines + 4
dates = lines[date_lines]
print('All dates are listed as follows')
print(dates)
readline('Press enter to continue: ')
#3.d
year_regexp <- regexpr("[0-2][0-9][0-9][0-9]", dates); 
years = regmatches(dates, year_regexp)
print('All years are listed as follows')
print(years)
readline('Press enter to continue: ')
#3.e
month_regexp <- regexpr("[A-Z][a-z]+", dates); 
months = regmatches(dates, month_regexp)
print('All months are listed as follows')
print(months)
readline('Press enter to continue: ')
#3.f
name_lines <- star_lines + 3
names <- unique(lines[name_lines])
print('All names of the presidents are listed as follows')
print(names)
readline('Press enter to continue: ')
# 3.g
# Chop the speeches up into a list there is one element for each speech. Each element is a character vector. 
# and make each element of the vector a character string corresponding to a sentence in the speech Word Vectors

speech_list = c()
for(i in 1:(length(star_lines)-1)){
	next_chapter = paste(lines[star_lines[i] : (star_lines[i+1]-1)], collapse='\n')
	speech_list = c(speech_list, next_chapter)
}
print('The speech is chopped into one element for each speech')
readline('Press enter to continue: ')

# Eliminate apostrophes, numbers, and the phrase: (Applause.) from the text.
print('Eliminate apostrophes, numbers, and the phrase: (Applause.) from the text.')
gsub('["0-9]', '', speech_list)
gsub('(Applause.)', '', speech_list)

