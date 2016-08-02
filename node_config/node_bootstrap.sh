#!/bin/bash

cd ~/home/jenkins/workspace/Chef-apache/.chef/

# Creates a role for tomcat
sudo knife role from file /home/jenkins/workspace/Chef-apache/roles/apache.rb

# Bootstrap a node to its chef server
sudo knife bootstrap 54.175.232.159 --ssh-user ubuntu --sudo --identity-file /home/ubuntu/.ssh/agiletrailblazers.pem -N Rigil_Nod$

# ssh into the chef node and execute the chef client to run its run list from chef server

ssh -i /home/ubuntu/.ssh/agiletrailblazers.pem ubuntu@54.175.232.159 "sudo chef-client"

