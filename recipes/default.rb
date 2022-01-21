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

include_recipe 'ssh_setup::setup_ssh_config'
