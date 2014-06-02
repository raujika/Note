Some code fragment

--update git

git remote add origin https://github.com/raujika/Note.git

git push origin master

--create hoogle

cabal install hoogle

echo >> ~/.ghci ':def hoogle \x -> return $ ":!hoogle \"" ++ x ++ "\""'

echo >> ~/.ghci ':def doc \x -> return $ ":!hoogle --info \"" ++ x ++ "\""'

chmod g-w ~/.ghci

