numbers=[1,2..]

multiples :: Integral a => [a] -> [a]
multiples [] = []
multiples (x:xs)
  | even x || mod x 3==0 || mod x 5 ==0 = x:multiples xs
  | otherwise = multiples xs

answer = multiples numbers