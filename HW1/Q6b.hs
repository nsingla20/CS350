
-- ****Q6b*****

multiples :: Integral a => [a] -> [a]
multiples [] = []
multiples (x:xs)
  | even x || mod x 3==0 || mod x 5 ==0 = x:multiples xs
  | otherwise = multiples xs

q6b = multiples [1,2..]

-- ****Q6b*****