# Cookbook Name: vault
# Attribute: default

default['vault']['version']          = '0.7.0'
default['vault']['sha256']           = 'c6d97220e75335f75bd6f603bb23f1f16fe8e2a9d850ba59599b1a0e4d067aaa'
default['vault']['download_url']     = "https://releases.hashicorp.com/vault/#{default['vault']['version']}/vault_#{default['vault']['version']}_linux_amd64.zip"
default['vault']['bin']              = '/usr/bin'

default['vault']['conf_cookbook']    = 'vault'
default['vault']['systemd_cookbook'] = 'vault'

default['vault']['tls_disabled']     = true
default['vault']['lib_path']         = '/usr/lib/vault'
default['vault']['command_options']  = ['-config=/etc/vault.conf']

default['vault']['scheme']           = 'http'
default['vault']['tcp_addr']         = '0.0.0.0:8200'
default['vault']['addr']             = "#{default['vault']['scheme']}://127.0.0.1:8200"
default['vault']['redirect_addr']    = ''
default['vault']['cluster_addr']     = ''
default['vault']['config_path']      = nil
default['vault']['skip_verify']      = false

default['vault']['tls_disabled']     = default['vault']['scheme'] == 'http'
default['vault']['tls_cert_file']    = '/etc/ssl/private/asterisk.node.consul.crt'
default['vault']['tls_key_file']     = '/etc/ssl/private/asterisk.node.consul.key'
default['vault']['disable_cache']    = false
default['vault']['disable_mlock']    = false

default['vault']['consul_addr']     = '127.0.0.1:8500'
default['vault']['consul_path']     = 'vault'
default['vault']['consul_scheme']   = 'http'
default['vault']['consul_ha']       = false

case node['platform_family']
when 'rhel', 'fedora'
  default['vault']['sysconfig_dir']    = '/etc/sysconfig'
  default['vault']['systemd_unit_dir'] = '/usr/lib/systemd/system'
when 'debian'
  default['vault']['sysconfig_dir']    = '/etc/default'
  default['vault']['systemd_unit_dir'] = '/lib/systemd/system'
end
