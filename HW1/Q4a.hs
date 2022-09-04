
-- ****Q4a*****
zip' :: [a]->[b]->[(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (a:as) = (x,a):zip' xs as

-- ****Q4a*****