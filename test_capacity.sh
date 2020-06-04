#/bin/bash

result=`node test_activegarden.js`
echo $result
echo "activegarden.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`node test_b12.js`
echo $result
echo "b12.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`node test_roccadion.js`
echo $result
echo "roccadion.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`node test_rockerei.js`
echo $result
echo "rockerei.count ${result} `date +%s`" | nc -q0 graphite 2003

result=`node test_waldau.js`
echo $result
echo "waldau.count ${result} `date +%s`" | nc -q0 graphite 2003
