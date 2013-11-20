printf <- function(...)print(sprintf(...))

#Q2.a
filename<-readline("input filename:")
word<-readline("input word:")

lines = readLines(filename)

buf = grep(paste('.*', word, '.*'), lines)

if(length(buf) == 0){
	printf('File %s does not contain %s', filename, word)
}else{
	printf('File %s contains %s', filename, word)
}
#Q2.b

