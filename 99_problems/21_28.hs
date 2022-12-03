import Data.Array (Ix(range))
-- Q21
insertAt' a l n =gen l n where
    gen (x:xs) i 
      | i==1 = (a:(x:xs))
      | otherwise = x:gen xs (i-1)
    gen [] _=[a]

-- Q22
range' i j
  | j<i = []
  | j==i = [j]
  | otherwise = i:range' (i+1) j

-- Q26
-- combinations 0 _ = []
-- combinations _ [] = []
combinations n l = [e | e<-(foldr f [[]] l),length e == n] where
    f a b = [(a:i)|i<-b,(length i)<n]++[(i)|i<-b,(length i)<=n]


data Car = Car {company :: String, model :: String, year :: Int} deriving (Show) 

data Barry t k p = Barry { yabba :: p, dabba :: t k }  