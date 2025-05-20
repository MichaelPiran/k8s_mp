# wsl
cp /c/Users/piran/Desktop/k8s_mp/master/.vagrant/machines/master_k8s_local/virtualbox/private_key /vagrant/master_private_key
cp /c/Users/piran/Desktop/k8s_mp/worker1/.vagrant/machines/worker1_k8s_local/virtualbox/private_key /vagrant/worker1_private_key
chmod 0600 /vagrant/master_private_key
chmod 0600 /vagrant/worker1_private_key