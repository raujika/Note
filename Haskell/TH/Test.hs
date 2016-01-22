{-# LANGUAGE TemplateHaskell #-}
module Test where
import Language.Haskell.TH

cnst :: Int -> String -> Q Exp
cnst n s = return (LamE (replicate n WildP) (LitE (StringL s)))
