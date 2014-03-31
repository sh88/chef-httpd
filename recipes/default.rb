package "httpd"

template "/etc/httpd/conf/httpd.conf" do
  owner    "root"
  mode     0644
  source   "httpd.conf.erb"
  supports :status => true, :restart => true, :reload => true
  notifies :reload, "service[httpd]"
end

directory node[:httpd][:document_root] do
  owner "apache"
  group "apache"
  mode  0755
end

service "httpd" do
  action [:enable, :start]
  reload_command "service httpd graceful"
end
