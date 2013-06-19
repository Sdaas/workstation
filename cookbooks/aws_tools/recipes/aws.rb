
package "unzip"


# Download and Install the EC2 Command-Line Tools

remote_file "/tmp/ec2-cli.zip" do
  source "#{node['aws_tools']['ec2']['source']}"
  action :create_if_missing
end

execute "unzip /tmp/ec2-cli.zip -d #{node['aws_tools']['aws_tools_target']}" do
  action :run
end

# And link to it ...
execute "ln -s #{node['aws_tools']['aws_tools_target']}/ec2-api-tools-* #{node['aws_tools']['aws_tools_target']}/#{node['aws_tools']['ec2']['target']}" do
  action :run
end


# Download and Install the Autoscaling Command-Line Tools

remote_file "/tmp/as-cli.zip" do
  source "#{node['aws_tools']['as']['source']}"
  action :create_if_missing
end

execute "unzip /tmp/as-cli.zip -d #{node['aws_tools']['aws_tools_target']}" do
  action :run
end

# And link to it ...
execute "ln -s #{node['aws_tools']['aws_tools_target']}/AutoScaling-* #{node['aws_tools']['aws_tools_target']}/#{node['aws_tools']['as']['target']}" do
  action :run
end



# Add the AWS Tools to the PATH
file "/etc/profile.d/aws_tools.sh" do
  content <<-EOS
  export AWS_TOOLS=#{node['aws_tools']['aws_tools_target']}
  export EC2_HOME=$AWS_TOOLS/#{node['aws_tools']['ec2']['target']}
  export AWS_AUTO_SCALING_HOME=$AWS_TOOLS/#{node['aws_tools']['as']['target']}
  export PATH=$PATH:$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin
  EOS
  mode 0755
end

#export AWS_ELB_HOME=~/dev/awstools/elb-cli
#export BEANSTALK_HOME=~/dev/awstools/elasticbeanstalk-cli
#
#export AWS_IAM_HOME=~/dev/awstools/iam-cli
#export AWS_CLOUDFORMATION_HOME=~/dev/awstools/cfn-cli
#export AWS_RDS_HOME=~/dev/awstools/rds-cli
