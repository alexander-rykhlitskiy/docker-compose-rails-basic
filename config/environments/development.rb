# https://stackoverflow.com/a/20012536/4862360
if File.read('/proc/1/cgroup').include?('docker')
  # https://stackoverflow.com/a/24716645/4862360
  host_ip = `/sbin/ip route|awk '/default/ { print $3 }'`.strip

  BetterErrors::Middleware.allow_ip!(host_ip) if defined?(BetterErrors::Middleware)
  config.web_console.whitelisted_ips << host_ip

  # https://github.com/rails/web-console/blob/2-x-stable/lib/web_console/railtie.rb#L56
  # WebConsole::Request.whitelisted_ips = WebConsole::Whitelist.new(host_ip)

  ActionMailer::Base.delivery_method = :file
  ActionMailer::Base.file_settings   = { location: "#{Rails.root}/tmp/mails" }
end
