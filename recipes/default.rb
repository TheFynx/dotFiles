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

%w(
  gitconfig
  gitignore
  vimrc
).each do |filename|
  template "#{node["dotfiles"]["profile"]["home_path"]}/.#{filename}" do
    source "#{filename}.erb"
    owner node["dotfiles"]["profile"]["user"]
    group node["dotfiles"]["profile"]["group"]
    mode 00775
  end
end

template "#{node["dotfiles"]["profile"]["home_path"]}/.config/terminator/config" do
    source "terminator/config.erb"
    owner node["dotfiles"]["profile"]["user"]
    group node["dotfiles"]["profile"]["group"]
    mode 00775
end
