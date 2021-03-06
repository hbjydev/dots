Vagrant.require_version ">= 1.8.0"

Vagrant.configure("2") do |config|
  config.vm.define "fedora" do |fedora|
    fedora.vm.box = "generic/fedora33"
  end

#  config.vm.define "ubuntu" do |ubuntu|
#    ubuntu.vm.box = "generic/ubuntu2004"
#  end

#  config.vm.define "arch" do |arch|
#    arch.vm.box = "generic/arch"
#  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/adhoc-init.yml"
    ansible.extra_vars = {
      install_remote: true
    }
    ansible.skip_tags = "gui"
  end
end
