# Cookbook Name: vault
# Recipe: default

include_recipe 'vault::setup'
include_recipe 'vault::config'
include_recipe 'vault::install'

service 'vault' do
  supports :start => true, :status => true, :restart => true
  action [:start, :enable]
end
