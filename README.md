# Text2Image Docker

## How to Run
1. Build the Docker image:
 ```
 docker build -t text2image .
```
2. Run the Docker container with GPU support:

```
docker run --gpus all --name test-ai -p 7860:7860 -d text2image:latest
```
## Description
This Dockerfile creates a Docker image for running the Text2Image application. It includes necessary dependencies and sets up the environment for running the application.

## Usage
- NVIDIA GPU Drivers image is used by default.
- AMD GPU Drivers image is available but not yet tested.
## Installation Steps
Update the package repository and install necessary packages:

```
apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3.10 \
    python3.10-venv \
    google-perftools \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*
```
Add a non-root user:

```
useradd -m user
```
Switch to the non-root user:

```
USER user
```
Set the working directory:

```
WORKDIR /home/user
```
Clone the repository and create a virtual environment:

```
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui && \
    cd stable-diffusion-webui && \
    python3.10 -m venv venv
```
## Exposed Ports
Port 7860 is exposed for communication.
## Running the Application
The Docker container runs the webui script as its command:

```
CMD ["/bin/bash", "-c", "./stable-diffusion-webui/webui.sh --listen"]
```

### All the possible ARG to pass
```
https://github.com/AUTOMATIC1111/stable-diffusion-webui/blob/master/modules/cmd_args.py
```
