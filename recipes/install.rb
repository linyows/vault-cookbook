# Cookbook Name: vault
# Recipe: install

cache_path = Chef::Config[:file_cache_path]
bin_path = '/usr/bin'

remote_file "#{cache_path}/vault-#{node['vault']['version']}.zip" do
  source node['vault']['download_url']
  checksum node['vault']['sha256']
  action :create_if_missing
end

bash "expand vault-#{node['vault']['version']}" do
  not_if "test -f #{node['vault']['lib_path']}/bin/vault-#{node['vault']['version']}"
  code <<-CODE
    cd "#{cache_path}"
    unzip vault-#{node['vault']['version']}.zip
    chmod +x vault
    mv vault #{node['vault']['lib_path']}/bin/vault-#{node['vault']['version']}
  CODE
end

link "#{bin_path}/vault" do
  to "#{node['vault']['lib_path']}/bin/vault-#{node['vault']['version']}"
  notifies :reload, 'service[vault]', :delayed
end
