# My Websites Dock

Anchoring my websites in a container

## Overview

I use Docker to host all my static websites in one nginx container.

I wrote [this Terraform configuration file](main.tf) to create a VM on Azure, where the container is hosted.

I have recently migrated my dock to Hetzner and there I have not yet terraformed the virtual machine.

I manually installed Docker on the VM, then I wrote [this Ansible playbook](my-websites-dock.yml) to build and deploy the container to the VM.

So, in order to redeploy my websites, I run the following command.

```
ansible-playbook my-websites-dock.yml
```

## Playbook details

The playbook performs the tasks below to build the websites on the local host in a folder structured as follows.

```
websites
│
├── fabioscagliola.com
│   │
│   ├── contents
│   │   │
│   │   ├── index.html
│   │   ├── ...
│   │
│   ├── fabioscagliola.com.crt
│   ├── fabioscagliola.com.key
│
├── nothence.com
│   │
│   ├── contents
│   │   │
│   │   ├── index.html
│   │   ├── ...
│   │
│   ├── nothence.com.crt
│   ├── nothence.com.key
│
```

- Create the websites folders
- Copy the .crt and .key files
- Create a temporary folder
- Clone the repos to the temporary folder
- Build the websites made with Hugo
- Copy the contents of the websites from the temporary folder
- Compress the websites folders

Then the playbook performs the following tasks to deploy the websites to the remote host:

- Upload the files required to build the image
- Extract the compressed websites folder
- Build the image
- Restart the container

