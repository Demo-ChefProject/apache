execute "tomcat7 installation" do
 command "sudo apt-get update"
 command "sudo apt-get install tomcat7"
end

template "/home/ubuntu/config.conf" do
  source "template.erb"
  variables( :a => 'Hello', :b => 'World', :c => 'Ololo' )
end

