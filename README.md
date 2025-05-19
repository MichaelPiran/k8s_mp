# k8s_mp

cd ansible
vagrant up

cd ../master
vagrant up

cd ../worker1
vagrant up

# copy ssh key to .ssh ansible
scp C:\Users\piran\Desktop\k8s_mp\master\.vagrant\machines\master_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/master_private_key

scp C:\Users\piran\Desktop\k8s_mp\worker1\.vagrant\machines\worker1_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/worker1_private_key

# run ansible
cd ansible
ansible-playbook -i hosts.ini all1.yaml


# config.toml
sudo containerd config default | sudo tee /etc/containerd/config.toml > /dev/null

# copi kube-flannel.yaml
scp /vagrant/kube-flannel.yml vagrant@192.168.56.32:/home/vagrant/kube-flannel.yaml
