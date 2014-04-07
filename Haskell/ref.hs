-- Continuation Passing Style

cps :: (a -> b -> (b -> b) -> b) -> b -> [a] -> b
cps f z [] = z 
cps f z (x:xs) = f x z (\y -> cps f y xs)

myMap func l = cps (\a bl h -> (func a):(h bl)) [] l

myFilter func l = cps (\a bl h -> if func a then a: (h bl) else h bl) [] l

-- Recusion
f :: (Num a,Eq a) => a -> a
f 1 = 1
f x = x * f(x-1)

fib 1 = 1
fib n = fib (n-1) + fib (n-2)

quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

qsort [] = []
qsort (p:xs) = (qsort [x | x <- xs, x < p]) ++ [p] ++ (qsort [x | x <- xs, x >= p])









