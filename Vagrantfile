Vagrant.configure("2") do |config|
  # Use Ubuntu 22.04 as the base box
  config.vm.box = "ubuntu/focal64"

  # Set up the virtual machine with a static IP
  config.vm.network "private_network", ip: "192.168.56.10"

  # Forward common ports
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true # React Dev Server
  config.vm.network "forwarded_port", guest: 5000, host: 5000, auto_correct: true # Flask Dev Server
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true  # HTTP
  config.vm.network "forwarded_port", guest: 443, host: 8443, auto_correct: true # HTTPS
  config.vm.network "forwarded_port", guest: 8000, host: 8000, auto_correct: true # Django Dev Server

  # Configure VM resources
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Provisioning with Ansible Local
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "install_dependencies.yml"
  end
end