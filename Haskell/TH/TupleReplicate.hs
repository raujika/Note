{-# LANGUAGE TemplateHaskell #-}
module TupleReplicate where

import Language.Haskell.TH

tupleReplicate :: Int -> Q Exp
tupleReplicate n = do id <- newName "x"
                      return $ LamE [VarP id]
                                    (TupE $ replicate n $ VarE id)

-- $((newName "x") >>= (\id -> return (LamE [VarP id] (TupE $ replicate 1 $ VarE id)))) 1
