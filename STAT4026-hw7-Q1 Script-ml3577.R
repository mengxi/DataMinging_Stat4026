#Q1.a
#Take two numbers and print their sum
x <- readline("input x :")
y <- readline("input y :")
sum = as.numeric(x)+as.numeric(y)
print(paste('The sum of x and y is: ', sum))
#Q1.b
x <- readline("input x :")
if(as.numeric(x)%%2==1)print("x is odd")
if(as.numeric(x)%%2==0)print("x is even")
#Q1.c
 x <- readline("input x :")
 for(i in 1:10){
 	string = paste("x *", i, "=", as.numeric(x)*i)
 	print(string)	
 }
 
 