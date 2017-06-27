case platform
when 'mac_os_x'
  default['dotfiles']['profile']['group'] = 'staff'
  default['dotfiles']['profile']['home'] = "/Users/#{node['dotfiles']['profile']['user']}"
when 'windows'
  default['dotfiles']['profile']['group'] = 'levi'
  default['dotfiles']['profile']['home'] = "C:/users/#{node['dotfiles']['profile']['user']}"
else
  default['dotfiles']['profile']['group'] = 'levi'
  default['dotfiles']['profile']['home'] = "/home/#{node['dotfiles']['profile']['user']}"
end

default['dotfiles']['docker']['user'] = 'thefynx'
default['dotfiles']['profile']['user'] = 'levi'
