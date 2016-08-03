execute "tomcat7 installation" do
 command "sudo apt-get update"
 command "sudo apt-get install tomcat7"
 command "sudo apt-get install tomcat7-admin"
end

template "/etc/tomcat7/tomcat-users.xml" do
  source "tomcat-users.erb"
  variables( :user_name => 'admin', :creds => 'rigiladmin')
end

execute "deploy webapp to tomcat7" do
  command "rm /var/lib/tomcat7/webapps/rigil-18f-pool2.war"
  command "rm -rf /var/lib/tomcat7/webapps/rigil-18f-pool2"
  
  command "sudo wget http://54.175.158.124:8081/repository/Rigil/rigil-18f-pool2.war"
  command "sudo mv rigil-18f-pool2.war /var/lib/tomcat7/webapps"
end

execute "tomcat7 restart" do
 command "sudo service tomcat7 restart"
end
