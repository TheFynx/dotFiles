
%w(
  bash_profile
  bashrc
  profile
  gitconfig
  gitignore
  tmux.conf
  vimrc
).each do |filename|
  link "#{node[:dotfiles][:home_path]}/.#{filename}" do
    action :delete
    only_if "test -L #{node[:dotfiles][:home_path]}/.#{filename}"
  end
end

%w(
  bash_profile
  bashrc
  profile
  gitconfig
  gitignore
  tmux.conf
  vimrc
).each do |filename|
  cookbook_file "#{node[:dotfiles][:home_path]}/.#{filename}" do
    source filename
    owner node[:dotfiles][:user]
  end
end

link "#{node[:dotfiles][:home_path]}/.bundle" do
    action :delete
    only_if "test -L #{node[:dotfiles][:home_path]}/.bundle"
end

directory "#{node[:dotfiles][:home_path]}/.bundle" do
    owner node[:dotfiles][:user]
    recursive true
end

link "#{node[:dotfiles][:home_path]}/.vim" do
    action :delete
    only_if "test -L #{node[:dotfiles][:home_path]}/.vim"
end

directory "#{node[:dotfiles][:home_path]}/.vim" do
    owner node[:dotfiles][:user]
    recursive true
end

directory "#{node[:dotfiles][:home_path]}/.vim/bundle" do
    owner node[:dotfiles][:user]
    recursive true
end

directory "#{node[:dotfiles][:home_path]}/.vim/swap" do
    owner node[:dotfiles][:user]
    recursive true
end

link "#{node[:dotfiles][:home_path]}/.config/terminator" do
    action :delete
    only_if "test -L #{node[:dotfiles][:home_path]}/.config/terminator"
end

directory "#{node[:dotfiles][:home_path]}/.config/terminator" do
    owner node[:dotfiles][:user]
    recursive true
end

directory "#{node[:dotfiles][:home_path]}/.config/terminator/plugins" do
    owner node[:dotfiles][:user]
    recursive true
end

cookbook_file "#{node[:dotfiles][:home_path]}/.config/terminator/config" do
    source 'terminator/config'
    owner node[:dotfiles][:user]
end

%w(
terminator/plugins/LayoutManager.py
terminator/plugins/LayoutManager.pyc
terminator/plugins/searchplugin.py
terminator/plugins/searchplugin.pyc
terminator/plugins/TerminalExporter.py
terminator/plugins/TerminalExporter.pyc
).each do |filename|
  cookbook_file "#{node[:dotfiles][:home_path]}/.config/#{filename}" do
      source filename
      owner node[:dotfiles][:user]
  end
end
