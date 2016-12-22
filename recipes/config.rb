# Cookbook Name:vault
# Recipe: config

template '/etc/vault.conf' do
  source 'vault.conf.erb'
  user 'vault'
  group 'vault'
  mode '0644'
  cookbook node['vault']['conf_cookbook']
  action :create
  notifies :restart, 'service[vault]', :delayed
end
