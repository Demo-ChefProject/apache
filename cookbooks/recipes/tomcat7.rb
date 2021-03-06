execute "tomcat7 installation" do
 command "sudo apt-get update"
 command "sudo apt-get install tomcat7"
 command "sudo apt-get install tomcat7-admin"
end

template "/etc/tomcat7/tomcat-users.xml" do
  source "tomcat-users.erb"
  variables( :user_name => 'admin', :creds => 'rigiladmin')
end

template "/etc/tomcat7/server.xml" do
  source "server.erb"
  variables( :port => '8081')
end



remote_file '/home/ubuntu/rigil-18f-pool2.war' do
  source 'http://54.175.158.124:8081/repository/Rigil/rigil-18f-pool2.war'
  mode '0755'
  owner 'tomcat7'
  group 'tomcat7'
  action :create
end


execute "deploy webapp to tomcat7" do
  command "rm /var/lib/tomcat7/webapps/rigil-18f-pool2.war"
  command "rm -rf /var/lib/tomcat7/webapps/rigil-18f-pool2"
#  command "sudo wget http://54.175.158.124:8081/repository/Rigil/rigil-18f-pool2.war"
  command "sudo mv /home/ubuntu/rigil-18f-pool2.war /var/lib/tomcat7/webapps"
end



execute "tomcat7 restart" do
 command "sudo service tomcat7 restart"
end
