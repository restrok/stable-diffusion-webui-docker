## How to run?
## > docker build -t text2image .
## > docker run --gpus all --name test-ai -p 7860:7860 -d text2image:latest

# NVIDIA GPU Drivers image
FROM nvidia/cuda:12.3.2-cudnn9-runtime-ubuntu22.04

# AMD GPU Drivers image - Not tested yet
# rocm/pytorch:rocm5.7_ubuntu22.04_py3.10_pytorch_2.0.1

# Update package repository and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3.10 \
    python3.10-venv \
    google-perftools \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Add a non-root user
RUN useradd -m user

# Switch to the non-root user
USER user

# Set the working directory
WORKDIR /home/user

# Clone the repository and create virtual environment
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui && \
    cd stable-diffusion-webui && \
    python3.10 -m venv venv

# Expose ports 7860
EXPOSE 7860

# Run the webui script
CMD ["/bin/bash", "-c", "./stable-diffusion-webui/webui.sh --listen"]
