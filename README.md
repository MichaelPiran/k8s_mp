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

[plugins."io.containerd.grpc.v1.cri"]
  sandbox_image = "registry.k8s.io/pause:3.9"
  [plugins."io.containerd.grpc.v1.cri".containerd]
    snapshotter = "overlayfs"
    [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
      runtime_type = "io.containerd.runc.v2"
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
        SystemdCgroup = true

# copy kube-flannel.yaml
scp /vagrant/kube-flannel.yaml vagrant@192.168.56.32:/home/vagrant/kube-flannel.yaml

# copy openebs-values.yaml
scp /vagrant/openebs-values.yaml vagrant@192.168.56.32:/home/vagrant/openebs-values.yaml.yaml