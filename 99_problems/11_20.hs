-- Q11
data Element a = Single a | Multiple Int a deriving (Show)
encodeModified [] = []
encodeModified (x:xs) = first: encodeModified rest where
    getRep [] = (0,[])
    getRep (y:ys)
      | x==y = let (n1,r) = getRep ys in (1+n1,r)
      | otherwise = (0,(y:ys))
    (n,rest)=getRep (x:xs)
    first 
      |n==1 = Single x
      |otherwise = Multiple n x

-- Q12
decodeModified l = foldr f [] l where 
    f (Single x) b = x:b
    f (Multiple 0 x) b = b
    f (Multiple n x) b = x:(f (Multiple (n-1) x) b)

-- Q14
repli []=[]
repli (x:xs)=x:(x:(repli xs))

--Q15
repli' [] _ = []
repli' (x:xs) n = (gen x n) ++ (repli' xs n) where
    gen x 0 = []
    gen x n = x:(gen x (n-1))

-- Q16
dropEvery l n = gen l 1 where
    gen [] _ =[]
    gen (x:xs) n1 
      | n1==n = gen xs 1
      | otherwise = x:(gen xs (n1+1))

--Q17
split' [] k = ([],[])
split' (x:xs) k 
  | k==0 = ([],(x:xs))
  |otherwise = let (f,r)=(split' xs (k-1)) in (x:f,r)

-- Q18
slice' l i j = post (pre l i) (j-i) where
    pre [] _ = []
    pre (x:xs) i1
      | i1==1 = (x:xs)
      | otherwise = pre xs (i1-1)
    
    post [] _ = []
    post l j1
      | j1==1 = l
      | otherwise = post (init l) (j1-1)

-- Q19
rotate' l i 
  | i>0 = rotate' (go1p l) (i-1)
  | i<0 = rotate' (go1n l) (i+1)
  | otherwise = l where
    go1p []=[]
    go1p (x:xs)=xs++[x]

    go1n []=[]
    go1n l=((last l):(init l))

--Q20
removeAt _ [] = []
removeAt k (x:xs)
  | k==1 = xs
  |otherwise = x:(removeAt (k-1) xs)