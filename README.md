Some code fragment

--install vi plugin

:PluginInstall

--kill port

sudo lsof -t -i tcp:8888 | xargs kill -9

--start smb

sudo /etc/init.d/smbd restart

--create net git repo

git init

--config git

git config --global user.name

git config --global user.email

--update git

git commit -m ""

git add .

git remote add origin https://github.com/raujika/Note.git

git push origin master

--create hoogle

cabal install hoogle

echo >> ~/.ghci ':def hoogle \x -> return $ ":!hoogle \"" ++ x ++ "\""'

echo >> ~/.ghci ':def doc \x -> return $ ":!hoogle --info \"" ++ x ++ "\""'

chmod g-w ~/.ghci

