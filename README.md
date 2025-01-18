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

## Playbook details

The playbook performs the following tasks on my local computer:

- Create the websites' folders using the following structure

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
│   │── fabioscagliola.com.crt
│   │── fabioscagliola.com.key
│
├── nothence.com
│   │
│   ├── contents
│   │   │
│   │   ├── index.html
│   │   ├── ...
│   │
│   │── nothence.com.crt
│   │── nothence.com.key
│
```

- Copy the .crt files and .key files from my local computer to the websites' folders—TODO: move the files to a different online secure location, such as a vault
- Create a temporary folder
- Clone the repos to the temporary folder
- For the websites made with Hugo, delete the public folders and build the websites
- Copy the contents from the temporary folder to the websites' folders
- Build the Docker image and compress it

Then the playbook performs the following tasks on the VM:

- Stop the container
- Prune the containers and images
- Upload the compressed image
- Extract the image
- Load the image
- Delete the compressed image
- Start the container

Finally, it cleans up the local environment by deleting the above structure, the temporary folder, and the Docker images

