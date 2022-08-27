takeAlternate :: Int->[a]->[a]
takeAlternate 0 _ = []
takeAlternate _ [] = []
takeAlternate n [x,_] = [x]
takeAlternate n [x] = [x]
takeAlternate n (x:(y:xs)) = x:takeAlternate (n-1) xs

