---
title: jenkins启动jar
date: 2021-09-12 12:59:53
tags: jenkins
---

```bash
#!/bin/bash
cd ${WORKSPACE}
echo "Stopping sso"
port=8990
pid=$(netstat -nlp | grep :$port | awk '{print $7}' | awk -F"/" '{ print $1 }');
if [ -n "$pid" ]
then
   echo "kill -9 pid:" $pid
   kill -9 $pid
fi
echo "Execute shell Finish"
BUILD_ID=dontKillMe java  -jar target/demo-0.0.1.jar    &
```