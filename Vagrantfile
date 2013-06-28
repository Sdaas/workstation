# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid32"

  config.vm.provider :virtualbox do |vb|

    # Give a name to this VM
    vb.name = "aws_workstation"

    # Don't boot with headless mode
    #vb.gui = true
  
    # Use VBoxManage to customize the VM. For example to change memory:
    #vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  # Share your AWS Keys folder to the vagrant VM
  # config.vm.synced_folder "/path/to/keys", "/home/vagrant/awskeys"


  # Shell script to run at startup
  # See http://docs.vagrantup.com/v2/provisioning/shell.html
  # The script.sh file needs to be present in relative to Vagrantfile on the _host_ machine
  config.vm.provision :shell, :path => "script.sh"


  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # Also see http://docs.vagrantup.com/v2/provisioning/chef_solo.html
  #
  config.vm.provision :chef_solo do |chef|
     #chef.log_level = :debug
     chef.cookbooks_path = "cookbooks"
     chef.roles_path = "roles"
     chef.data_bags_path = "data_bags"
     chef.add_role "java"
     chef.add_recipe "java"
     chef.add_recipe "python"
     chef.add_recipe "s3cmd-master"
     chef.add_recipe "aws_tools"
  
    # You may also specify custom JSON attributes:
    chef.json = { 
        "s3cmd" => {
          "user" => "vagrant",
          "home" => "/home/vagrant",
          "encrypt" => false,
          "secret_key" => "$AWSSecretKey",
          "access_key" => "$AWSAccessKeyId",
          "bucket_location" => "$AWS_REGION"
        }
    }
  end

end

