
Summary
=======

This projects creates an ubuntu vm containing all the AWS command-line tools. 

Right now, it installs the following tools

* ec2-cli

( others are work in progress )


Instructions to Use VM
======================

( work in progress )

* Install [VirtualBox](http://www.virtualbox.org)
* Install [Vagrant](http://www.vagrantup.com)
* Grab the VM

		vagrant box add my-aws-workstation https://dl.dropboxusercontent.com/u/3469227/workstation-20130616.box

* Confirm that it is on your machine

		vagrant box list

* Prepare to launch 
       
		vagrant init my-aws-workstation

* Edit Vagrantfile - make sure that is it configured to used this vm 

      	config.vm.box = "my-aws-workstation"

* Launch VM and ssh into it

		vagrant up
		vagrant ssh

* Rename awskeys.sample to awskeys - and edit the contents of the folder
* ec2_cert : Containing your ec2-certificate
* ec2-private-key : Containing your ec2-private-key
* .awscredentials : Must contain the following entries

		AWSAccessKeyId= ...
		AWSSecretKey= ....

* Uncomment all the lines from .bash_profile
* Run ec2-describe-regions to see if everything works

AWS Keys on local Machine
--------------------------

In general, it is not a good idea to keep your AWS keys on the VM. A better way is to store them
on the host machine, and mount the path containing the keys to the vm.

* Edit Vagrantfile - mount the folder containing the awskeys

		config.vm.synced_folder "/path/to/folder/with/keys", "/home/vagrant/awskeys"

* Make sure that your .bash_profile is pointing to the right folder


Cookbooks
----------

The following cookbooks are used for this project

* [Java](http://community.opscode.com/cookbooks/java)
* [Windows](http://community.opscode.com/cookbooks/windows) (required by java)
* [Chef_Handler](http://community.opscode.com/cookbooks/chef_handler)
* [Python](http://github.com/opscode-cookbooks/python)
* [Build-Essential](http://community.opscode.com/cookbooks/build-essential) (required by python)
* [Yum](http://github.com/opscode-cookbooks/yum) (required by python)
* [Chef-S3CMD](http://community.opscode.com/cookbooks/s3cmd-master)