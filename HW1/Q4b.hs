zipWith :: (a->b->c)->[a]->[b]->[c]
zipWith _ _[] = []
zipWith _ [] _ = []
zipWith f (x:xs) (a:as) = f x a:Main.zipWith f xs as