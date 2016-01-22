module Main where

import Printf ( pr,printf )
import Derive

main3 = putStrLn ( $(printf "Error in file %s line %d: %s") "io.cpp" 325 "printer not found" )

main = putStrLn ( $(pr "Hello") )

data T = A Int String | B Integer | C
$(deriveShow ''T)

main2 = print [A 1 "s", B 2, C]