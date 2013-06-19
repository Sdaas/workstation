
default['aws_tools']['aws_access_key'] = 'Your Access Key'
default['aws_tools']['aws_secret_key'] = 'Your Secret Key'

## AWS Tools ##
default['aws_tools']['aws_tools_target'] = '/usr/local/share/aws_tools'

default['aws_tools']['ec2']['source'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip'
default['aws_tools']['ec2']['target'] = 'ec2'

default['aws_tools']['as']['source'] = 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'
default['aws_tools']['as']['target'] = 'as'

default['aws_tools']['elb']['source'] = 'http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip'
default['aws_tools']['elb']['target'] = 'elb'

default['aws_tools']['cloudwatch']['source'] = 'http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip'
