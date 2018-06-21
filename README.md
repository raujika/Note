Some code fragment

--install vi plugin

:PluginInstall

--kill port

sudo lsof -t -i tcp:8888 | xargs kill -9

--start smb

sudo /etc/init.d/smbd restart

sudo smbpasswd -a raujikachu

testparm

sudo setenforce 0

systemctl disable firewalld

systemctl stop firewalld

chkconfig smb on

chkconfig nmb on

service nmb restart

service smb restart

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

--list ghc installed package

stack exec -- ghc-pkg list

--grub

grub2-set-default "Fedora Linux, with Linux 3.1.2-1.fc16.i686.PAE"

grub2-editenv list

grub2-mkconfig -o /boot/grub2/grub.cfg

--cdrom

eject

eject -t

umount cdrom

--ctags

ctags -R *

--curl

curl http://some.url --output some.file

--search header

sudo yum whatprovides '*/varargs.h'
dnf provides "*/ndbm.h"
grep -rn "struct _IO_FILE {" --include="*.h" /usr/include

--remove interface(fedora)
ifconfig interface down

--prog with same name such as ld
alternatives --config ld

--check git
git submodule update --init --recursive

--vim

ctrl+]
ctrl+t
--linux kernel input header
/usr/include/linux/input.h
--get kernel message
journalctl -k
--get bus definition
cat /proc/bus/input/devices
--nodejs tty
tty.js --port 8080
