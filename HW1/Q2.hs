last :: [a]->a
last [] = error "List cannot be empty"
last [x] = x
last (x:xs) = Main.last xs