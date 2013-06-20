
# Create a directory to install all the tools in
directory "#{node['aws_tools']['aws_tools_target']}" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

# Create the AWS Setup File from the template
template "#{node['aws_tools']['aws_tools_target']}/awssetup.sh" do
  source "awssetup"
  mode 0755
  owner "root"
  group "root"
end

# All environment variables and path to the tools will
# be written in this file
file "/etc/profile.d/aws_tools.sh" do
  mode 0755
  owner "root"
  group "root"
  content "# Created by Chef. "
  action :create_if_missing
end


# Create the vagrant user's bash_profile from the template
template "/home/vagrant/.bash_profile" do
  source "bash_profile"
  mode 0755
  owner "vagrant"
  group "vagrant"
end

# Create the sample AWSkeys directory
directory "/home/vagrant/awskeys.sample" do
  owner "vagrant"
  group "vagrant"
  mode 00644
  action :create
end

# Create the vagrant user's ec2-cert file
template "/home/vagrant/awskeys.sample/ec2-cert" do
  source "ec2-cert"
  mode 0644
  owner "vagrant"
  group "vagrant"
end

# Create the vagrant user's ec2-private-key
template "/home/vagrant/awskeys.sample/ec2-private-key" do
  source "ec2-private-key"
  mode 0644
  owner "vagrant"
  group "vagrant"
end

# Create the vagrant user's .awscredentials file
template "/home/vagrant/awskeys.sample/.awscredentials" do
  source "awscredentials"
  mode 0644
  owner "vagrant"
  group "vagrant"
end