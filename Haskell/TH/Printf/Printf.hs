module Printf where

-- Import Template Haskell interfaces
import Language.Haskell.TH

-- Describe a format string
data Format = D            -- represents "%d"
            | S            -- represents "%s"
            | L String     deriving (Show)-- represents other parts of format string, printed literally

-- Parse a format string.
parse :: String -> String -> [Format]
parse ('%':'s':xs) rest  =  L rest : S : parse xs ""
parse ('%':'d':xs) rest  =  L rest : D : parse xs ""
parse ""           rest  = [L rest]
parse (x:xs)       rest  =  parse xs (rest++[x])

-- Generate Haskell source code from a parsed representation
-- of the format string.  This code will be spliced into
-- the module which calls "printf", at compile time.
gen :: [Format] -> ExpQ -> ExpQ
gen [] code = code
gen (D : xs) code = [| \x-> $(gen xs [| $code++show x |]) |]
gen (S : xs) code = [| \x-> $(gen xs [| $code++x |]) |]
gen (L s : xs) code = gen xs [| $code++s |]

-- Here we generate the Haskell code for the splice
-- from an input format string.
printf :: String -> ExpQ
printf s = gen (parse s "") [| "" |]