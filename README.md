# My Websites' Dock

Anchoring my websites in a container

This project uses Docker to host multiple websites in one container using nginx, based on the "Host" header.

## Usage

Build the image and start the container using the following command.

```bash
make up
```

Edit your `/etc/hosts` to include the following line.

```bash
127.0.0.1       fabioscagliola.com
```

Give it a try by requesting one of the websites using the following command.

```bash
curl -H https://fabioscagliola.com
```

Stop and remove the container using the following command.

```bash
make down
```

And do not forget to clean up the `/etc/hosts` file.

