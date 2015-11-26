case node[:platform]
when "centos", "rhel"
  if node[:httpd][:use_scl]
    package "centos-release-SCL" do
      action :install
    end

    server_package = "httpd24-httpd"
    devel_package  = "httpd24-httpd-devel"
    service_name   = "httpd24-httpd"
  elsif node[:httpd][:use_ius]
    package "epel-release" do
      action :install
    end
    
    ius_rpm = "#{Chef::Config[:file_cache_path]}/#{File.basename(node[:httpd][:ius_rpm_uri])}"

    remote_file "#{ius_rpm}" do
      source node[:httpd][:ius_rpm_uri]
      not_if "rpm -q ius-release"
    end

    rpm_package ius_rpm do
      action :install
      not_if "rpm -q ius-release"
    end

    file ius_rpm do
      action :delete
    end

    server_package = "httpd24u"
    devel_package  = "httpd24u-devel"
    service_name   = "httpd"
  else
    server_package = "httpd"
    devel_package  = "httpd-devel"
    service_name   = "httpd"
  end
end

package server_package do
  action :install
end

node[:httpd][:packages].each do |pkg|
  package pkg do
    action :install
  end
end

file node[:httpd][:sysconfig] do
  content lazy {
    f = Chef::Util::FileEdit.new(path)
    f.insert_line_if_no_match(/NSS_SDB_USE_CACHE/, "export NSS_SDB_USE_CACHE=#{node[:httpd][:nss_sdb_use_cache]}\n")
    f.send(:editor).lines.join
  }
end

template node[:httpd][:httpd_conf] do
  owner    "root"
  mode     0644
  source   "httpd#{node[:httpd][:version_without_dot]}.conf.erb"
  supports :status => true, :restart => true, :reload => true
  notifies :reload, "service[#{service_name}]"
end

link node[:httpd][:server_root] do
  to lazy { "/opt/rh/httpd24/root/etc/httpd" }
  only_if { node[:httpd][:use_scl] }
end

link "/usr/lib64/httpd" do
  to lazy { "/opt/rh/httpd24/root/usr/lib64/httpd" }
  only_if { node[:httpd][:use_scl] }
end

directory node[:httpd][:document_root] do
  owner     node[:httpd][:user]
  group     node[:httpd][:group]
  mode      0755
  recursive true
end

service service_name do
  action [:enable, :start]
  reload_command "service #{service_name} graceful"
end
