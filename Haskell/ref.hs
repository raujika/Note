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

import System.Environment(getArgs)

main :: IO()
main = do
       args <- getArgs
       print args

data Tr x = Leaf x | Branch (Tr x) (Tr x)
data MF = [Char]

class MF f where
  kmap                  :: (a -> b) -> f a -> f b

instance MF Tr where
  kmap f (Leaf x)       = Leaf   (f x)
  kmap f (Branch t1 t2) = Branch (kmap f t1) (kmap f t2)

-- (\x -> x++"f") . (\x -> x++"s") $ "x"
-- "xsf"


--the "DO"
--do x1 <- action1
--   x2 <- action2
--   action3 x1 x2
--
--action1 >>= \ x1 ->
--action2 >>= \ x2 ->
--action3 x1 x2
--
--action1
--  >>=
--    \
--      x1
--        ->
--          action2
--            >>=
--              \
--                x2
--                  ->
--                    action3
--                      x1
--                      x2

--(simpleHttp "http://lianchun.myweb.hinet.net/Birthday_password/") >>= \ c -> return (L.unpack c)

--(simpleHttp "http://lianchun.myweb.hinet.net/Birthday_password/") >>= \ c -> return (indexOf (L.unpack c) "<div align=\"center\"><a href=")

--(simpleHttp "http://lianchun.myweb.hinet.net/Birthday_password/") >>= \ c -> return (map (28+) (indexOf (L.unpack c) "<div align=\"center\"><a href="))

--(simpleHttp "http://lianchun.myweb.hinet.net/Birthday_password/") >>= \ c -> return (map (28+) (indexOf (L.unpack c) "<div align=\"center\"><a href="))








