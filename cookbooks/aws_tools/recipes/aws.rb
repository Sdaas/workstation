
package "unzip"

aws_tools "ec2" do
  source "http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip"
  base "ec2-api-tools"
  envname "EC2_HOME"
end

aws_tools "as" do
  source "http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip"
  base "AutoScaling"
  envname "AWS_AUTO_SCALING_HOME"
end



#export AWS_ELB_HOME=~/dev/awstools/elb-cli
#export BEANSTALK_HOME=~/dev/awstools/elasticbeanstalk-cli
#export AWS_IAM_HOME=~/dev/awstools/iam-cli
#export AWS_CLOUDFORMATION_HOME=~/dev/awstools/cfn-cli
#export AWS_RDS_HOME=~/dev/awstools/rds-cli
