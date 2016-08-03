#!/bin/bash

cd ~/home/jenkins/workspace/Chef-apache/

# Creates a role for tomcat
sudo knife role from file /home/jenkins/workspace/Chef-apache/roles/apache.rb

# Upload cookbooks into Chef Server
knife upload cookbooks apache

# Bootstrap a node to its chef server
sudo knife bootstrap 54.175.232.159 --ssh-user ubuntu --sudo --identity-file /home/ubuntu/.ssh/agiletrailblazers.pem -N Rigil_Node -r 'role[apache]'

# ssh into the chef node and execute the chef client to run its run list from chef server

ssh -i /home/ubuntu/.ssh/agiletrailblazers.pem ubuntu@54.175.232.159 "sudo chef-client -l debug"
