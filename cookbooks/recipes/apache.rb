remote_file 'D:\NC4\MC3' do
  source 'vardeclarations.rb'
  variables( :nexus => 'http://devmcnexus21.nc4.local:8081/repository/maven-releases/org/apache/apache-httpd-32/2.2.32/apache-httpd-32-2.2.32.zip')
end

execute 'unzip apache' do
  command 'cd D:\NC4\MC3'
  command 'unzip apache-httpd-32-2.2.32.zip D:\NC4\MC3\HTTPD'
end

execute 'remove logs' do
  command 'cd D:\NC4\MC3\HTTPD'
  command 'RD /S /Q D:\NC4\MC3\HTTPD\logs'
  command 'RD /S /Q D:\NC4\MC3\HTTPD\errors'
end

file 'D:\NC4\MC3\HTTPD\conf\extra\MC3AgileDev.conf' do
  source 'httpd-vhosts.conf'
end

template 'D:\NC4\MC3\HTTPD\conf\httpd.conf' do
  source 'httpd.erb'
  variables( :mcapp => 'MC3AgileDev')
end

execute 'Create Windows service for Apache' do
  command 'cd D:\NC4\HTTPD\bin'
  command 'httpd.exe -k install -n "Apache 2.2 HTTP"'
  command 'sc \\server config ServiceName obj= Domain\user password= pass'
end
