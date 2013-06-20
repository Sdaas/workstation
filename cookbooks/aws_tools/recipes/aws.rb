
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

aws_tools "elb" do
  source "http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip"
  base "ElasticLoadBalancing"
  envname "AWS_ELB_HOME"
end

aws_tools "rds" do
  source "http://s3.amazonaws.com/rds-downloads/RDSCli.zip"
  base "RDSCli"
  envname "AWS_RDS_HOME"
end

aws_tools "cfn" do
  source "https://s3.amazonaws.com/cloudformation-cli/AWSCloudFormation-cli.zip"
  base "AWSCloudFormation"
  envname "AWS_CLOUDFORMATION_HOME"
end


#default['aws_tools']['cloudwatch']['source'] = 'http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip'
#export BEANSTALK_HOME=~/dev/awstools/elasticbeanstalk-cli
#export AWS_IAM_HOME=~/dev/awstools/iam-cli
# CloudWatch

