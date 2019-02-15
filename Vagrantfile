# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.define "nextcloud" do |nc|
    nc.vm.hostname = "nextcloud"
    nc.vm.network "public_network", use_dhcp_assigned_default_route: true
    nc.vm.synced_folder "nc_data", "/media/sf_NCData", disabled: false, automount: true, owner: "www-data", group: "www-data"
    config.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", "2048"]
       vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    nc.vm.provision "shell", inline: $script
  end

$script = <<SCRIPT
echo Provisioning NextCloud VM ...
# This is a comment
sudo mkdir -p /var/www/nextcloud
sudo useradd www-data -G vboxsf
sudo chown -R www-data:www-data /var/www/nextcloud/
sudo mv /var/www/nextcloud /var/www/nextcloud.bak
sudo apt-get update
sudo apt purge mysql* nginx* php* redis* -y && apt autoremove -y

sudo git clone https://github.com/ashwinbangalore/install-nextcloud.git

cd install-nextcloud

sudo cp /vagrant/nc_id_config.sh ./nc_id_config.sh

chmod 755 ./install-nextcloud-ubuntu.sh
chmod 755 ./nc_id_config.sh

sudo ./install-nextcloud-ubuntu.sh

SCRIPT

end
