FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu22.04

# See https://docs.nvidia.com/metropolis/deepstream/7.1/text/DS_Installation.html for DeepStream 7.1 installation help.
# See https://docs.nvidia.com/metropolis/deepstream/dev-guide/text/DS_Installation.html for details on DeepStream dependencies.
# DeepStream 8.x also requires the libmosquitto1 package.
RUN apt-get update && apt-get install -y \
    libssl3 \
    libssl-dev \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstreamer-plugins-base1.0-dev \
    libgstrtspserver-1.0-0 \
    libjansson4 \
    libyaml-cpp-dev
