
Summary
=======

This projects creates an ubuntu vm containing all the AWS command-line tools. 

Right now, it installs the following tools

* ec2-cli
* s3cmd

( others are work in progress )


Instructions to Use VM
======================

( work in progress )

* Install [VirtualBox](http://www.virtualbox.org)
* Install [Vagrant](http://www.vagrantup.com)
* Install a SSH client like [Putty](http://www.putty.org) or [Gnu on Windows](https://github.com/bmatzelle/gow/downloads)
* Grab the VM

		vagrant box add mybox http://bit.ly/19eS7dI

* Confirm that it is on your machine

		vagrant box list

* Prepare to launch 
       
		vagrant init mybox

* Edit Vagrantfile - make sure that is it configured to used this vm 

      	config.vm.box = "mybox"

* Launch VM and ssh into it. 

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

Previous VMs
============

* [v0.1](https://dl.dropboxusercontent.com/u/3469227/workstation-20130616.box) : First version. ec2-cli only


To Create a New VM
==================

* Start from scratch and setup the VM

	vagrant destroy
	vagrant up

* Test that the VM is working as designed and then shut it down

	vagrant halt

* Create a new Box


Push this to dropbox and update the README.md file to point to the new location


Cookbooks
=========

The following cookbooks are used for this project

* [Java](http://community.opscode.com/cookbooks/java)
* [Windows](http://community.opscode.com/cookbooks/windows) (required by java)
* [Chef_Handler](http://community.opscode.com/cookbooks/chef_handler)
* [Python](http://github.com/opscode-cookbooks/python)
* [Build-Essential](http://community.opscode.com/cookbooks/build-essential) (required by python)
* [Yum](http://github.com/opscode-cookbooks/yum) (required by python)
* [Chef-S3CMD](http://community.opscode.com/cookbooks/s3cmd-master)