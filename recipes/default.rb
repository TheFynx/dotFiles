%w(
  bash_profile
  bashrc
  profile
  exports
  aliases
  dockerfunc
  functions
  path
).each do |filename|
  template "#{node["dotfiles"]["profile"]["home_path"]}/.#{filename}" do
    source "#{filename}.sh.erb"
    owner node["dotfiles"]["profile"]["user"]
    group node["dotfiles"]["profile"]["group"]
    mode 00775
  end
end

template "name" do
  source "source.erb"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "#{node[:dotfiles][:home_path]}/.config/terminator/config" do
    source 'terminator/config'
    owner node[:dotfiles][:user]
end
