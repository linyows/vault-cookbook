# Cookbook Name: vault
# Recipe: setup

package 'unzip'
package 'curl'

group 'vault' do
  system true
end

user 'vault' do
  shell '/bin/false'
  system true
  gid 'vault'
  comment 'Service user for vault'
end

directory '/etc/vault.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory "#{node['vault']['lib_path']}/bin" do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/usr/lib/systemd/system/vault.service' do
  source 'vault.service'
  owner 'root'
  group 'root'
  mode '0755'
  cookbook node['vault']['systemd_cookbook']
  notifies :restart, 'service[vault]', :delayed
end

template '/etc/sysconfig/vault' do
  source 'sysconfig.vault.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[vault]', :delayed
end

template '/etc/profile.d/vault.sh' do
  source 'profile.d.vault.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
