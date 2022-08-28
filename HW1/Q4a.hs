zip :: [a]->[b]->[(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (a:as) = (x,a):Main.zip xs as