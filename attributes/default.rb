default[:httpd] = {
  :ius_base_uri => "https://%{platform}%{platform_version}.iuscommunity.org/ius-release.rpm",
  :use_ius      => false,
  :use_scl      => false,
  :version      => 2.2,
  :sysconfig    => "/etc/sysconfig/httpd",
  :httpd_conf   => "/etc/httpd/conf/httpd.conf",
  :packages     => [],
  :nss_sdb_use_cache         => "YES",
  :server_root               => "/etc/httpd",
  :timeout                   => 60,
  :keepalive                 => "Off",
  :keepalive_requests        => 100,
  :keepalive_timeout         => 15,
  :max_request_workers       => 50,
  :max_connections_per_child => 1000,
  :prefork => {
      :start_servers          => 8,
      :min_spare_servers      => 75,
      :max_spare_servers      => 75,
      :server_limit           => 256,
      :max_clients            => 256,
      :max_requests_per_child => 400,
  },
  :worker => {
      :start_servers          => 4,
      :max_clients            => 300,
      :min_spare_threads      => 75,
      :max_spare_threads      => 75,
      :threads_per_child      => 75,
      :max_requests_per_child => 0,
  },
  :listen            => "127.0.0.1:80",
  :server_name       => "localhost:80",
  :user              => "apache",
  :group             => "apache",
  :server_admin      => "root@localhost",
  :document_root     => "/var/www/html",
  :name_virtual_host => "*:80",
  :includes => [
  ]
}

if node[:httpd][:use_scl]
  default[:httpd][:version] = 2.4 
  default[:httpd][:version_without_dot] = "24"
  default[:httpd][:sysconfig]  = "/opt/rh/httpd24/root/etc/sysconfig/httpd" 
  default[:httpd][:httpd_conf] = "/opt/rh/httpd24/root/etc/httpd/conf/httpd.conf"
elsif node[:httpd][:use_ius]
  default[:httpd][:version] = 2.4 
  default[:httpd][:version_without_dot] = "24"
else
  default[:httpd][:version_without_dot] = node[:httpd][:version].to_s.delete('.')
end

default[:httpd][:ius_rpm_uri] = node[:httpd][:ius_base_uri] % {
  :platform         => node[:platform],
  :platform_version => node[:platform_version].to_i,
}
