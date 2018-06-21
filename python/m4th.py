#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
from urllib.request import urlopen
from urllib import request
import json
import http.cookiejar
import urllib
from subprocess import call
import urllib.parse
import time

cj = http.cookiejar.MozillaCookieJar()
#opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cj))
opener.addheaders = [('User-agent', 'Mozilla/5.0')]
html = opener.open("http://web1.polyu.work/spaceCTF/web100/", data=bytes(json.dumps({'value': 1}),"utf-8"))
source=html.read();
for c in range(0,100):
    soup = BeautifulSoup(source, "lxml")
    print(''.join(soup.find('br').next_siblings))
    print(''.join(soup.find('br').next_siblings)[10:''.join(soup.find('br').next_siblings).find("=")])
    key=int(
    	eval(
    		''.join(
    			soup.find('br').next_siblings
    			)[10:''.join(soup.find('br').next_siblings).find("=")]
    		)
    	)
    print(key)
    data = urllib.parse.urlencode({'value': key})
    data = data.encode('ascii')
    time.sleep(5)
    req = opener.open("http://web1.polyu.work/spaceCTF/web100/", data)
    source=req.read();
    print(source);

