# From zero to k8s development environment... In minutes!

Thanks to [k3s] by [RancherLabs], we can get a minimalistic, "lightweight, easy to install, half the memory, all in a binary less than 40mb" [Kubernetes] distribution running on our laptop with little to zero overhead (it's thought for IoT/ARM environments!). 
It does not even need [Docker] to run, as it completely relies on [containerd] for the setup.

As I'm desigining a development worflow and CI/CD pipeline based on Kubernetes, k3s sounds like a perfect option for setting up a local development environment locally on my (Linux) laptop that diverges as little as possible from the rest of the enviroments of the pipeline.
[Minikube] was another good option and it's the most suitable way to go for other base-OS such as MacOS, or even for Linux using [KVM2] as driver (which was my first approach); but its setup is a bit more complex and is not as lightweight as k3s.

Even if k3s is pretty straight forward to install, I do like to script any potentially repeatable process into my own human-readable [baids] (BASH functions), so I did it and [k8s-baids] is the result. I will be using and referencing baids from this collection in the rest of the post.
Through using _baids_ I can abstract developers in the team from jumping from a README.md to another and asking questions about tooling and development environment setup. I manage that for them and if they get curious or want to go "the hard way", they can look into the small bash behind the scenes :)

Let's go on with the setup!

## Local development environment using k3s + skaffold 

We'll assume my team mate has just received his pristine Linux laptop and need to install our development environment from the scratch. These would be my directions:

```
# baids install
curl -sSL https://raw.githubusercontent.com/rcmorano/baids/master/baids | bash -s install
source $HOME/.baids/baids

# k8s-baids install
git clone https://github.com/rcmorano/k8s-baids.git ~/.baids/functions.d/k8s-baids
baids-reload

# k3s install
k3s-install

# skaffold install
skaffold-install

# clone project's repo
# skaffold run
# develop!
```

## QA environment on CircleCI

## 

[baids]: https://github.com/rcmorano/baids
[containerd]: https://containerd.io/
[k3s]: https://github.com/rancher/k3s
[kubectl]: https://github.com/kubernetes/kubectl
[Kubernetes]: https://kubernetes.io/
[kompose]: https://github.com/kubernetes/kompose
[minikube]: https://github.com/kubernetes/minikube
[RancherLabs]: https://rancher.com/about/
[skaffold]: https://github.com/GoogleContainerTools/skaffold
