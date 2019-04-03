# https://stackoverflow.com/questions/29417328/how-to-disable-cannot-render-console-from-on-rails#answer-42142563
config.web_console.whitelisted_ips = Socket.ip_address_list.reduce([]) do |res, addrinfo|
  addrinfo.ipv4? ? res << IPAddr.new(addrinfo.ip_address).mask(24) : res
end
