chef-httpd
==========

Chef cookbook for httpd

# Attributes

Attribute | Description | Type | Default
----------|-------------|------|--------
`[:httpd][:version]` | httpd version `2.2` `2.4` | String or Float | `2.2`
`[:httpd][:version_without_dot]` | httpd version (without dot) | String | `22`
`[:httpd][:ius_base_uri]` | base RPM URI (for CentOS, RHEL) | String | `https://%{platform}%{platform_version}.iuscommunity.org/ius-release.rpm`
`[:httpd][:ius_rpm_uri]` | RPM URI (for CentOS, RHEL) | String | CentOS 6 : `https://centos6.iuscommunity.org/ius-release.rpm`
`[:httpd][:packages]` | yum packages | Array | `[]`
`[:httpd][:use_scl]` | use centos-release-scl (for CentOS) | Boolean | `false`
`[:httpd][:use_ius]` | use ius-release (for CentOS, RHEL) | Boolean | `false`
`[:httpd][:user]` | httpd user | String | `apache`
`[:httpd][:group]` | httpd group | String | `apache`
`[:httpd][:sysconfig]` | sysconfig path | String | Default: `/etc/sysconfig/httpd`, SCL: `/opt/rh/httpd24/root/etc/sysconfig/httpd`
`[:httpd][:httpd_conf]` | httpd.conf | String | Default: `/etc/httpd/conf/httpd.conf`, SCL: `/opt/rh/httpd24/root/etc/httpd/conf/httpd.conf`
`[:httpd][:nss_sdb_use_cache]` | Set `NSS_SDB_USE_CACHE` | String | `YES`
`[:httpd][:server_root]` | config `ServerRoot` | String | `/etc/httpd`
`[:httpd][:timeout]` | config `Timeout` | Int | `60`
`[:httpd][:keepalive]` | config `Keepalive` | String | `Off`
`[:httpd][:keepalive_requests]` | config `KeepaliveRequests` | Int | 100
`[:httpd][:keepalive_timeout]` | config `KeepaliveTimeout` | Int | 15
`[:httpd][:max_request_workers]` | config `MaxRequestWorkers (2.4)`, `MaxClients (2.2)` | Int | 50
`[:httpd][:max_connections_per_child]` | config `MaxConnectionsPerChild (2.4)`, `MaxRequestsPerChild (2.2)` | Int | 1000
`[:httpd][:listen]` | config `Listen` | String | `127.0.0.1:80`
`[:httpd][:server_name]` | config `ServerName` | String | `localhost:80`
`[:httpd][:server_admin]` | config `ServerAdmin` | String | `root@localhost`
`[:httpd][:document_root]` | config `DocumentRoot` | String | `/var/www/html`
`[:httpd][:name_virtual_host]` | config `NameVirtualHost` | String | `*:80`
`[:httpd][:includes]` | configs `Include /path/to/file` | Array | `[]`
`[:httpd][:prefork][:start_servers]` | config (prefork) `StartServers` | Int | `8`
`[:httpd][:prefork][:min_spare_servers]` | config (prefork) `MinSpareServers` | Int | `75`
`[:httpd][:prefork][:max_spare_servers]` | config (prefork) `MaxSpareServers` | Int | `75`
`[:httpd][:prefork][:server_limit]` | config (prefork) `ServerLimit` | Int | `256`
`[:httpd][:prefork][:max_clients]` | config (prefork) `MaxClients` | Int | `256`
`[:httpd][:prefork][:max_requests_per_child]` | config (prefork) `MaxRequestsPerChild` | Int | `400`
`[:httpd][:worker][:start_servers]` | config (worker) `StartServers` | Int | `4`
`[:httpd][:worker][:min_spare_servers]` | config (worker) `MinSpareServers` | Int | `75`
`[:httpd][:worker][:max_spare_servers]` | config (worker) `MaxSpareServers` | Int | `75`
`[:httpd][:worker][:threads_per_child]` | config (worker) `ServerLimit` | Int | `75`
`[:httpd][:worker][:max_clients]` | config (worker) `MaxClients` | Int | `300`
`[:httpd][:worker][:max_requests_per_child]` | config (worker) `MaxRequestsPerChild` | Int | `0`
