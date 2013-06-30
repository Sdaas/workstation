
Summary
=======

This projects creates an ubuntu vm containing all the AWS command-line tools. 

Right now, it installs the following tools

* s3cmd
* ec2-cli
* autoscaling cli 
* elastic load balancing cli
* rds cli
* cloudformation cli

( others are work in progress )
* cloudwatch
* aws-cli the mother of all aws cli
* boto the father of all aws cli
( simpleDB will NOT be installed )

Getting the VM
==============

The Simple Way
--------------

You don't have to clone this repo. Just grab a ready-made VM by following the instructions below

* Install [VirtualBox](http://www.virtualbox.org)
* Install [Vagrant](http://www.vagrantup.com)
* Install a SSH client like [Putty](http://www.putty.org) or [Gnu on Windows](https://github.com/bmatzelle/gow/downloads)
* Grab the VM

		vagrant box add mybox http://bit.ly/19IuSwq

* Prepare to launch 
       
		vagrant init mybox

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

In general, it is not a good idea to keep your AWS keys on the VM. A better way is to store them
on the host machine, and mount the path containing the keys to the vm.

* Edit Vagrantfile - mount the folder containing the awskeys

		config.vm.synced_folder "/path/to/folder/with/keys", "/home/vagrant/awskeys"

* Make sure that your .bash_profile is pointing to the right folder

The Hard Way
-------------

These instructions show you how to use this repo to create your own VM from scratch. BTW, if you dont want to do this
on a Windows box.

* Install Ruby 1.9.3 or later on your machine. ( good idea to use rvm )
* Install [berkshelf](http://berkshelf.com/)

		gem install berkshelf
	
* Install [VirtualBox](http://www.virtualbox.org)
* Install [Vagrant](http://www.vagrantup.com)
* Install the omnibus and berkshelf plugins for Vagrant

		vagrant plugin install vagrant-berkshelf
		vagrant plugin install vagrant-omnibus

* Clone this repo
* Using this as the current directory, run

		berks install

* This will install all the cookbooks specified in the Berksfile to your ~/.berkshelf folder. Get a list
of all the installed cookbooks by running

		berks shelf list

* Get the vagrant base image for ubuntu and store it as lucid32

		vagrant box add lucid32 http://files.vagrantup.com/lucid32.box

* Start from scratch and setup the VM

		vagrant up

* SSH into the VM

		vagrant sshvagrant halt

* You can now create a new box out of this VM if you like.

		vagrant package --output whatever.box 


Cookbooks
=========

The following cookbooks are used for this project

* [Java](http://community.opscode.com/cookbooks/java)
* [Python](http://github.com/opscode-cookbooks/python)
* [Chef-S3CMD](http://community.opscode.com/cookbooks/s3cmd-master)
* [AWStools](https://github.com/Sdaas/awstools)
