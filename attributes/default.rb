default[:httpd] = {
  :server_root        => "/etc/httpd",
  :timeout            => 60,
  :keepalive          => "Off",
  :keepalive_requests => 100,
  :keepalive_timeout  => 15,
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

