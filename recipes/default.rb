#
# Cookbook:: ssh_setup
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'centos', 'amazon', 'almalinux'
  package %w(openssh openssh-server)
  service 'sshd' do
    action [ :start, :enable ]
  end
when 'ubuntu'
  package %w(openssh-client openssh-server)
  service 'sshd' do
    action [ :start, :enable ]
  end
end

# The recipe pass Security/Compliance InSpec Scan.
include_recipe 'ssh_setup::setup_secure_ssh_config'

# The recipe fails on Security/Compliance InSpec Scan.
# include_recipe 'ssh_setup::setup_insecure_ssh_config'
