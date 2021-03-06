default[:nginx][:reinstall] = nil
default[:nginx][:version] = "1.4.2"
default[:nginx][:download_url] = "http://nginx.org/download/nginx-#{node[:nginx][:version]}.tar.gz"
default[:nginx][:checksum] = "#{node[:nginx][:download_url]}.asc"
default[:nginx][:user] = "www-data"
default[:nginx][:install_dir] = "/opt/nginx-#{node[:nginx][:version]}"
default[:nginx][:compile_flags] = [
  "--prefix=#{node[:nginx][:install_dir]}",
  "--user=#{node[:nginx][:user]}",
  "--group=#{node[:nginx][:user]}",
  "--with-ipv6"
]
default[:nginx][:modules] = [
  "--with-http_gzip_static_module",
  "--with-http_ssl_module",
  "--with-http_stub_status_module"
]

default[:nginx][:worker_processes] = node[:cpu] && node[:cpu][:total] ? node[:cpu][:total] : 1
default[:nginx][:worker_rlimit_nofile] = "30000"
default[:nginx][:event] = nil
default[:nginx][:worker_connections] = "6000"
default[:nginx][:server_names_hash_bucket_size] = "128"
default[:nginx][:rate_limit] = nil
default[:nginx][:rate_limit_zone] = nil
default[:nginx][:rate_limit_memory] = nil
default[:nginx][:rate_limit_rate] = nil

default[:nginx][:port] = "80"
default[:nginx][:server_name] = [ "localhost", "#{node[:fqdn]}" ]
