# My Websites' Dock

*Anchoring my websites in a container*

## Overview

I use Docker to host all my static websites in one nginx container.

I wrote [this Terraform configuration file](main.tf) to create a VM on Azure, where the container is hosted.

I manually installed Docker on the VM, then I wrote [this Ansible playbook](my-websites-dock.yml) to build and deploy the container to the VM.

So, in order to redeploy my websites, I run the following command.

```
ansible-playbook my-websites-dock.yml
```

## Folder structure

.....

```
websites
│
├── fabioscagliola.com
│   │
│   ├── contents
│   │   ├── index.html
│   │   ├── ...
│   │
│   │── fabioscagliola.com.crt
│   │── fabioscagliola.com.key
│
├── nothence.com
│   │
│   ├── contents
│   │   ├── index.html
│   │   ├── ...
│   │
│   │── nothence.com.crt
│   │── nothence.com.key
│
```

