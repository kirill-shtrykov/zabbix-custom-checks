#
# Cookbook Name:: zabbix-custom-checks
# Recipe:: hwraid-hp-smartarray
#
# Copyright 2014, Steffen Gebert / TYPO3 Association
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "zabbix-custom-checks::default"

template "#{node['zabbix']['agent']['include_dir']}/hwraid-hp-smartarray.conf" do
  source "hwraid/hp-smartarray.conf.erb"
  mode "644"
  notifies :restart, "service[zabbix_agentd]" if File.exist?("#{node['zabbix']['install_dir']}/zabbix_agentd")
end

template "/etc/sudoers.d/zabbix-hwraid-hp-smartarray" do
  source "hwraid/sudoers-hp-smartarray.erb"
  mode "440"
end
