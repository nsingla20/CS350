
foldR :: (a -> t -> t) -> t -> [a] -> t
foldR _ end [] = end
foldR binOp end l = foldR binOp (binOp (last l) end) (init l)

-- map Implementation
map :: (a->b)->[a]->[b]
map _ [] = []
map f l = foldR (\y ys -> (f y):ys) [] l