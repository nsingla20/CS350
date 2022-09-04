{-
Q1  takeAlternate :: Int->[a]->[a]
Q2  last' :: [a]->a
Q3  merge :: Ord a => [a]->[a]->[a]
Q4a zip' :: [a]->[b]->[(a,b)]
Q4b zipWith' :: (a->b->c)->[a]->[b]->[c]
Q5  foldR :: (a -> t -> t) -> t -> [a] -> t
Q5  map' :: (a->b)->[a]->[b]
Q6a answer in q6a variable
Q6b answer in q6b variable
-}

-- ****Q1*****
takeAlternate :: Int->[a]->[a]
takeAlternate 0 _ = []
takeAlternate _ [] = []
takeAlternate _ [x] = [x]
takeAlternate _ [x,_] = [x]
takeAlternate n (x:(y:xs)) = x:takeAlternate (n-1) xs

-- ****Q1*****
-- ****Q2*****
last' :: [a]->a
last' [] = error "List cannot be empty"
last' [x] = x
last' (x:xs) = last' xs

-- ****Q2*****
-- ****Q3*****
merge :: Ord a => [a]->[a]->[a]

merge [] [] = []

merge [] [x] = [x]
merge [x] [] = [x]

merge [] (x:(y:xs)) = 
    if x==y 
    then merge [] (y:xs) 
    else x:merge [] (y:xs)
merge (x:(y:xs)) [] = merge [] (x:(y:xs))

merge [x] [a]
  | x==a = [x]
  | x>a = [a,x]
  | otherwise = [x,a]

merge [x] (a:(b:as))
  | a==b = merge [x] (b:as)
  | x==a = x:merge [] (b:as)
  | x<a = x:merge [] (a:(b:as))
  | otherwise = a:merge [x] (b:as)
merge (a:(b:as)) [x] = merge [x] (a:(b:as))

merge (x:(y:xs)) (a:(b:as))
  | x==y = merge (y:xs) (a:(b:as))
  | a==b = merge (x:(y:xs)) (b:as)
  | x==a = x:merge (y:xs) (b:as)
  | x<a = x:merge (y:xs) (a:(b:as))
  | otherwise = a:merge (x:(y:xs)) (b:as)

-- ****Q3*****
-- ****Q4a*****
zip' :: [a]->[b]->[(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (a:as) = (x,a):zip' xs as

-- ****Q4a*****
-- ****Q4b*****
zipWith' :: (a->b->c)->[a]->[b]->[c]
zipWith' _ _[] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (a:as) = f x a:zipWith' f xs as

-- ****Q4b*****
-- ****Q5*****
foldR :: (a -> t -> t) -> t -> [a] -> t
foldR _ end [] = end
foldR binOp end l = foldR binOp (binOp (last l) end) (init l)

-- map Implementation
map' :: (a->b)->[a]->[b]
map' _ [] = []
map' f l = foldR (\y ys -> f y:ys) [] l

-- ****Q5*****
-- ****Q6a*****

q6a=[x | x<-[1,2..], even x||mod x 3 == 0||mod x 5==0]

-- ****Q6a*****
-- ****Q6b*****

multiples :: Integral a => [a] -> [a]
multiples [] = []
multiples (x:xs)
  | even x || mod x 3==0 || mod x 5 ==0 = x:multiples xs
  | otherwise = multiples xs

q6b = multiples [1,2..]

-- ****Q6b*****