import System.Environment(getArgs)
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


main :: IO()
main = do
       args <- getArgs
       print args

data Tr x = Leaf x | Branch (Tr x) (Tr x)

class MF f where
  kmap                  :: (a -> b) -> f a -> f b

instance MF Tr where
  kmap f (Leaf x)       = Leaf   (f x)
  kmap f (Branch t1 t2) = Branch (kmap f t1) (kmap f t2)

--Recursively-Defined
data T a = N | I a (T a)          deriving (Show)

instance Functor T where
    fmap f (I x z) = I (f x) (fmap f z)
    fmap _ N       = N 

--Currying
f x y = y x
g x = \y -> f x y 

--Monad
{--
instance Functor Wrapped where
  fmap f (Wrap x) = Wrap (f x)

instance Applicative Wrapped where
  pure = Wrap
  Wrap f <*> Wrap x = Wrap (f x)
 --}
newtype Wrapped a = Wrap {unwrap :: a} deriving (Show)

instance Monad Wrapped where 
    (>>=) (Wrap x) f =  f x 
    return x = Wrap x

divwrp :: Wrapped Double -> Wrapped Double -> Wrapped Double 
divwrp x y = do u <- x 
                v <- y 
                return (u/v)

--unpack io monad
--import System.IO.Unsafe
--putStrLn ((unsafePerformIO (getLine >>= \x -> return x))++"!")

--
--list monad
--return 1 = [1]
--[1,2,3] >>= (\x -> [x+1] = [2,3,4]
--
--unwrap (divwrp (Wrap 3.0) (Wrap 5.0)

main = putStr "aa"

-- (\x -> x++"f") . (\x -> x++"s") $ "x"
-- "xsf"
--hof
--($) :: (a -> b) -> a -> b
--f $ x = f x
--
--(.) :: (b -> c) -> (a -> b) -> a -> c
--f . g = \x -> f (g x)

--the "DO"
--do x1 <- action1
--   x2 <- action2
--   action3 x1 x2
--((parse stdin) >>= \ expr -> let (Eval cp) = eval exp;cp (Nothing, 2048) (const return))
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








