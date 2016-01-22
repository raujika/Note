module Main where
-- Import our template "printf"
import Printf (printf)
-- The splice operator $ takes the Haskell source code
-- generated at compile time by "printf" and splices it into
-- the argument of "putStrLn".
main = putStrLn ( $(printf "Error in file %s line %d: %s") "io.cpp" 325 "printer not found" )