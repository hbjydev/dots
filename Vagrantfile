#
# %%%%%%  %%  
# %%  %%  %%  
# %%  %%  %%  
# %%      %%   Hayden Young's Dotfiles
# %%  %%  %%   v1.0.0
# %%  %%  %%  
# %%  %%%%%%
#

Vagrant.require_version ">= 1.8.0"

Vagrant.configure("2") do |config|
  config.vm.define "fedora" do |fedora|
    fedora.vm.box = "generic/fedora33"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "temp.yml"
  end
end

