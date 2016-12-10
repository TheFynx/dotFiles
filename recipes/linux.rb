#
# Cookbook Name:: dotfiles
# Recipe:: linux
#
# Copyright (C) 2016 Levi Smith
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# rubocop:disable Style/NumericLiteralPrefix

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
  template "#{node['dotfiles']['profile']['home']}/.#{filename}" do
    source "#{filename}.sh.erb"
    owner node['dotfiles']['profile']['user']
    group node['dotfiles']['profile']['group']
    mode 00775
  end
end

%w(
  gitconfig
  gitignore
  vimrc
).each do |filename|
  template "#{node['dotfiles']['profile']['home']}/.#{filename}" do
    source "#{filename}.erb"
    owner node['dotfiles']['profile']['user']
    group node['dotfiles']['profile']['group']
    mode 00775
  end
end

directory "#{node['dotfiles']['profile']['home']}/.config/terminator" do
  owner node['dotfiles']['profile']['user']
  group node['dotfiles']['profile']['group']
  mode 00775
end

template "#{node['dotfiles']['profile']['home']}/.config/terminator/config" do
  source 'terminator/config.erb'
  owner node['dotfiles']['profile']['user']
  group node['dotfiles']['profile']['group']
  mode 00775
end

# Fonts
remote_directory "#{node['dotfiles']['profile']['home']}/.local/share/fonts" do
  source 'fonts'
  owner node['dotfiles']['profile']['user']
  group node['dotfiles']['profile']['group']
  mode 00775
  action :create
end

