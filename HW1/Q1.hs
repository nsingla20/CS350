takeAlternate :: Int->[a]->[a]
takeAlternate 0 _ = []
takeAlternate _ [] = []
takeAlternate _ [x] = [x]
takeAlternate _ [x,_] = [x]
takeAlternate n (x:(y:xs)) = x:takeAlternate (n-1) xs

