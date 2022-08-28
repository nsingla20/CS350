numbers=[1,2..]
answer=[x | x<-numbers, even x||mod x 3 == 0||mod x 5==0]