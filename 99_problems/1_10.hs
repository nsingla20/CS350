-- Q1
myLast [] = error "No element"
myLast [x] = x
myLast (x:xs) = myLast xs

-- Q2
myButLast [] = error "No element"
myButLast [x] = error "No element"
myButLast [x,y] = x
myButLast (x:xs) = myButLast xs

-- Q3
elementAt [] _ = error "Not possible"
elementAt (x:xs) 1 = x
elementAt (x:xs) n = elementAt xs (n-1)

-- Q4
myLength xs = foldr (\ x y-> (-) 1 y) 0 xs

-- Q5
myReverse x = foldl (\b a -> (a:b)) [] x

-- Q6
isPalindrome [] = True
isPalindrome [x] = True
isPalindrome (x:xs)
  | x == y = isPalindrome mid
  | otherwise = False
  where
    y = last xs
    mid = init xs

-- Q7
data NestedList a = Elem a | List [NestedList a]

flatten' (List l) = foldr f [] l where
    f (Elem a) b = a:b
    f (List l1) b = (flatten' (List l1)) ++ b
flatten' (Elem a) = [a]

-- Q8
compress l = foldr f [] l where
    f a [] = [a]
    f a (b:bs) 
      | a==b = (b:bs)
      | otherwise = (a:(b:bs))

-- Q9
pack'' [] = []
pack'' (x:xs) = (x:first) : pack'' rest where
    getRep [] =([],[])
    getRep (y:ys)
      | x==y = let (f,r)=getRep ys in (y:f,r)
      | otherwise = ([],(y:ys))
    (first,rest)=getRep xs

--Q10
encode' [] = []
encode' (x:xs) = (1+n,x): encode' rest where
    getRep [] = (0,[])
    getRep (y:ys)
      | x==y = let (n1,r) = getRep ys in (1+n1,r)
      | otherwise = (0,(y:ys))
    (n,rest)=getRep xs