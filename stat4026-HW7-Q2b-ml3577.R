printf <- function(...)print(sprintf(...))

isDates <- function(lines){
	## return a list of true/false list
	return(grepl('.*, [1-2][0-9]+', lines))
}

find_linenumbers_match_3stars <- function(lines){
	## return line numbers containing 3 stars
	grep('\\*\\*\\*',lines)
	star_lineNum = grep('\\*\\*\\*',lines)
	star_lineNum = star_lineNum[isDates(lines[star_lineNum + 4])]
	return(star_lineNum)
}

find_linenumbers_contain_word <- function(lines, word){
	return(grep(paste('.*', word, '.*'), lines))
}

starlines_to_president <- function(lines, line_numbers){
	return(lines[line_numbers + 3])
}

starlines_to_dates <- function(lines, line_numbers){
	return(lines[line_numbers + 4])
}

# filename<-readline("input filename:")
filename = 'stat4026-speech.txt'

word<-readline("input word:")
lines = readLines(filename)

lines_3stars = find_linenumbers_match_3stars(lines)
lines_contain_word <- find_linenumbers_contain_word(lines, word)
if(length(lines_contain_word)==0){
	printf('File %s does not contain %s', filename, word)
} else{
	chapter_contain_word <- c()
	for(i in 1:length(lines_contain_word)){
		chapter = max(lines_3stars[lines_3stars < lines_contain_word[i]])
		if(chapter %in% chapter_contain_word == FALSE)
			chapter_contain_word = c(chapter_contain_word, chapter)
	}

	print(paste(starlines_to_president(lines, chapter_contain_word),
                starlines_to_dates(lines, chapter_contain_word)))
}


