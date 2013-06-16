
Summary
=======

Installs all the AWS Command Line tools

Right now, it installs the following tools

* ec2-cli

( others are work in progress )


Instructions to Use VM
======================

( work in progress )

* Install VirtualBox  [http://www.virtualbox.com]
* Install Vagrant [http://www.vagrantup.com]
* Grab the VM

		vagrant box add my-aws-workstation https://dl.dropboxusercontent.com/u/3469227/workstation-20130616.box

* Check that it is on your machine

		vagrant box list

* Prepare to launch 
       
		vagrant init my-aws-workstation

* Edit Vagrantfile - make sure that is it configured to used this vm 

      	config.vm.box = "my-aws-workstation"


AWS Keys on Vagrant VM
----------------------

In this case, the AWS Keys are on the vagrant VM. Easy to start with, but this is not very secure.
Anyone who can launch your VM can get access to your keys

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

In this case, the AWSKeys are stored on the host machine, and the path is mounted when the VM launches

* Edit Vagrantfile - mount the folder containing the awskeys

		config.vm.synced_folder "/path/to/folder/with/keys", "/home/vagrant/awskeys"



Cookbooks
----------

The following cookbooks are used for this project

* [Java](http://community.opscode.com/cookbooks/java)
* [Windows](http://community.opscode.com/cookbooks/windows)
* [Chef_Handler](http://community.opscode.com/cookbooks/chef_handler)