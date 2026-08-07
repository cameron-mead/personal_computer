#/bin/bash

ping=$(ping -c 1 -W 1 8.8.8.8 | grep time=)
echo ${ping#*"time="}
