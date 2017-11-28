# used to test salt deployment
Vagrant.configure("2") do |config|
  config.vm.hostname = "vagrant"
  config.vm.box = "debian/contrib-stretch64"
  config.vm.box_version = "9.1.0"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  # add docker to vm
  config.vm.provision :docker
end
