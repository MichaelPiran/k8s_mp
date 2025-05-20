#!/bin/bash
scp C:\Users\piran\Desktop\k8s_mp\master\.vagrant\machines\master_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/master_private_key
scp C:\Users\piran\Desktop\k8s_mp\worker1\.vagrant\machines\worker1_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/worker1_private_key
chmod 0600 $HOME/.ssh/master_private_key
chmod 0600 $HOME/.ssh/worker1_private_key 

