name             'vault'
maintainer       'linyows'
maintainer_email 'linyows@gmail.com'
license          'MIT'
description      'Installs/Configures vault'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/vault/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/vault' if respond_to?(:source_url)

%w(centos redhat fedora ubuntu debian).each { |os| supports os }
