# k8s_mp
Kubernetes cluster on vm

## startup vm
cd ../master
vagrant up

cd ../worker1
vagrant up

## copy ssh key to .ssh ansible
scp .\k8s_mp\master\.vagrant\machines\master_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/master_private_key

scp .\k8s_mp\worker1\.vagrant\machines\worker1_k8s_local\virtualbox\private_key vagrant@192.168.56.21:/home/vagrant/.ssh/worker1_private_key

<!-- # config.toml
sudo containerd config default | sudo tee /etc/containerd/config.toml > /dev/null

[plugins."io.containerd.grpc.v1.cri"]
  sandbox_image = "registry.k8s.io/pause:3.9"
  [plugins."io.containerd.grpc.v1.cri".containerd]
    snapshotter = "overlayfs"
    [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
      runtime_type = "io.containerd.runc.v2"
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
        SystemdCgroup = true -->

## run
ansible-playbook -i hosts.ini all.yaml

## run wsl
ansible-playbook -i hosts_wsl.ini all_wsl.yaml