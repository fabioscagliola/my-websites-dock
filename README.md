# My Websites Dock

Anchoring my websites in a container

## Overview

I use Docker to host all my static websites in one nginx container.

I had initially written [this Terraform configuration file](main.tf) to create a virtual machine on Azure, where the container was hosted. I later migrated my dock to Hetzner, and there I have not yet terraformed the virtual machine.

I installed Docker on the virtual machine using [this Ansible playbook](https://github.com/fabioscagliola/ansible-install-docker-ubuntu), then I wrote [this one](my-websites-dock.yml) to build the image and deploy the container to the virtual machine.

So, in order to redeploy my websites, I run the following command.

```
ansible-playbook my-websites-dock.yml
```

## Playbook details

The playbook performs the tasks described below in order to **build the websites on the local host** in the following folder structure.

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

Then the playbook performs the following tasks to **deploy the websites to the remote host**.

- Upload the files required to build the image
- Extract the compressed websites folder
- Build the image
- Restart the container

