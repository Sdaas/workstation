#
# Read http://docs.opscode.com/essentials_cookbook_definitions.html
#

define :aws_tools, :source => '', :base => '', :envname => '' do

	require 'fileutils'
	package 'unzip'

    print "name  = #{params[:name]}"
	print "source= #{params[:source]}"
	print "base  = #{params[:base]}"
	print "env   = #{params[:envname]}"

	temp_file = "/tmp/#{params[:name]}.zip"
	puts "temp_file = #{temp_file}"

	remote_file "#{temp_file}" do
	  source "#{params[:source]}"
	  action :create_if_missing
	end

	target_dir = node['aws_tools']['aws_tools_target']

	execute "unzip #{temp_file} -d #{target_dir}" do
	  action :run
	end

	# And link to it ...
	execute "ln -s #{target_dir}/#{params[:base]}-* #{target_dir}/#{params[:name]}" do
  		action :run
	end

	# Add tha path to the cli tools
	ruby_block "add_path_to_cli" do
		block do
			file = Chef::Util::FileEdit.new("/etc/profile.d/aws_tools.sh")
			file.insert_line_if_no_match("/export AWS_TOOLS/", "export AWS_TOOLS=#{target_dir}")
			file.write_file
			file.insert_line_if_no_match("/export #{params[:envname]}/", "export #{params[:envname]}=$AWS_TOOLS/#{params[:name]}")
			file.write_file
			file.insert_line_if_no_match("/export PATH=\$PATH:\/$#{params[:envname]}\/bin/", "export PATH=$PATH:/$#{params[:envname]}/bin/")
			file.write_file
		end
	end

end






