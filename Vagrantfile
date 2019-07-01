Vagrant.configure("2") do |config|

  config.vm.define "nginx" do |nginx|
    nginx.vm.box = "ubuntu/xenial64"
    nginx.vm.hostname = "nginx"
    nginx.vm.synced_folder "nginx/", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]
    nginx.vm.synced_folder "wordpress", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
    nginx.vm.provision :shell, :path => "nginx/install.sh"
    nginx.vm.network :private_network, ip: "192.168.0.42"
    nginx.vm.network "forwarded_port", guest: 80, host: 8080
  end

  config.vm.define "mysql" do |mysql|
    mysql.vm.box = "ubuntu/xenial64"
    mysql.vm.hostname = "mysql"
    mysql.vm.synced_folder "mysql/", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]
    mysql.vm.provision :shell, :path => "mysql/install.sh"
    mysql.vm.network :private_network, ip: "192.168.0.43"
  end

  config.vm.define "php" do |php|
    php.vm.box = "ubuntu/xenial64"
    php.vm.hostname = "php"
    php.vm.synced_folder "php-fpm/", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]
    php.vm.synced_folder "wordpress", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
    php.vm.provision :shell, :path => "php-fpm/install.sh"
    php.vm.network :private_network, ip: "192.168.0.44"
  end

end

