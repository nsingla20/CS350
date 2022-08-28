merge :: Ord a => [a]->[a]->[a]
merge [] [] = []
merge [] [x] = [x]
merge [] (x:(y:xs)) = if x==y then merge [] (y:xs) else x:merge [] (y:xs)
merge [x] [] = [x]
merge (x:(y:xs)) [] = if x==y then merge (y:xs) [] else x:merge (y:xs) []
merge [x] [a]
  | x==a = [x]
  | x>a = [a,x]
  | otherwise = [x,a]
merge [x] (a:(b:as))
  | a==b = merge [x] (b:as)
  | x==a = x:merge [] (b:as)
  | x<a = x:merge [] (a:(b:as))
  | otherwise = a:merge [x] (b:as)
merge (a:(b:as)) [x]
  | a==b = merge [x] (b:as)
  | x==a = x:merge [] (b:as)
  | x<a = x:merge [] (a:(b:as))
  | otherwise = a:merge [x] (b:as)
merge (x:(y:xs)) (a:(b:as))
  | x==y = merge (y:xs) (a:(b:as))
  | a==b = merge (x:(y:xs)) (b:as)
  | x<a = x:merge (y:xs) (a:(b:as))
  | otherwise = a:merge (x:(y:xs)) (b:as)

