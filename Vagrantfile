
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.10"
  

  if Vagrant::Util::Platform.windows?
$script = <<SCRIPT
  # Install Ansible dependencies on first run:
  if [ ! -f /etc/ansible/hosts ]; then
    sudo apt-get update
    sudo apt-get install python python-dev python-pip git -y
	

	
	echo "Installing required python modules."
	sudo pip install paramiko pyyaml jinja2 markupsafe
	
    sudo pip install ansible

    # Create a simple inventory file for localhost:
    sudo mkdir -p /etc/ansible
    sudo touch /etc/ansible/hosts

    sudo echo "[vagrant]" >> /etc/ansible/hosts
    sudo echo "vagrant ansible_connection=local" >> /etc/ansible/hosts
  fi

  # We want Ansible's output line by line:
  export PYTHONUNBUFFERED=1

  ansible-playbook /vagrant/playbook.yml --limit "vagrant"
SCRIPT

      config.vm.provision "shell", inline: $script
  else
	config.vm.provision :ansible do |ansible|
		ansible.playbook = "playbook.yml"
		ansible.limit = "vagrant"
	end
  end

  config.vm.provision "shell", path: "bash/script/composer.sh"
end
