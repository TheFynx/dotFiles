%w(
  bash_profile
  bashrc
  gitconfig
  gitignore
  tmux.conf
  vimrc
).each do |filename|
  cookbook_file "#{node[:dotfiles][:home_path]}/.#{filename}" do
    source filename
    owner node[:dotfiles][:user]
    group node[:dotfiles][:group]
  end
end

directory "#{node[:dotfiles][:home_path]}/.bundle" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

directory "#{node[:dotfiles][:home_path]}/.vim" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

directory "#{node[:dotfiles][:home_path]}/.vim/bundle" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

directory "#{node[:dotfiles][:home_path]}/.vim/swap" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

directory "#{node[:dotfiles][:home_path]}/.config/terminator" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

directory "#{node[:dotfiles][:home_path]}/.config/terminator/plugins" do
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

cookbook_file "#{node[:dotfiles][:home_path]}/.config/terminator/config}" do
  source 'terminator/config'
  owner node[:dotfiles][:user]
  group node[:dotfiles][:group]
end

%w(
terminator/LayoutManager.py
terminator/LayoutManager.pyc
terminator/searchplugin.py
terminator/searchplugin.pyc
terminator/TerminalExporter.py
terminator/TerminalExporter.pyc
).each do |filename|
  cookbook_file "#{node[:dotfiles][:home_path]}/.config/terminator/plugins/#{filename}" do
    source filename
    owner node[:dotfiles][:user]
    group node[:dotfiles][:group]
  end
end
