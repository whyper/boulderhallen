#/bin/bash

export CLASSPATH=".:selenium-server-standalone-3.13.0.jar:testng-6.8.7.jar"

#result=`node test_activegarden.js`
#echo $result
#echo "activegarden.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`javac CheckB12.java && java CheckB12 2>/dev/null`
echo $result
echo "b12.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`javac CheckRoccadion.java && java CheckRoccadion 2>/dev/null`
echo $result
echo "roccadion.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`javac CheckRockerei.java && java CheckRockerei 2>/dev/null`
echo $result
echo "rockerei.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`javac CheckWaldau.java && java CheckWaldau 2>/dev/null`
echo $result
echo "waldau.count ${result} `date +%s`" | nc -q0 graphite 2003
