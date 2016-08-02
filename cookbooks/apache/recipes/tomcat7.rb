execute "tomcat7 installation" do
 command "sudo apt-get update"
 command "sudo apt-get install tomcat7"
end

template "/etc/tomcat7/tomcat-users.xml" do
  source "tomcat-users.erb"
  variables( :user_name => 'admin', :creds => 'rigiladmin')
end

execute "tomcat7 restart" do
 command "sudo service tomcat7 restart"
end
