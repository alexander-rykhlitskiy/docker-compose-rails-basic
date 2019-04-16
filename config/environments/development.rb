# https://stackoverflow.com/a/20012536/4862360
if File.read('/proc/1/cgroup').include?('docker')
  # https://stackoverflow.com/a/24716645/4862360
  host_ip = `/sbin/ip route|awk '/default/ { print $3 }'`.strip

  BetterErrors::Middleware.allow_ip!(host_ip) if defined?(BetterErrors::Middleware)
  config.web_console.whitelisted_ips << host_ip
end
