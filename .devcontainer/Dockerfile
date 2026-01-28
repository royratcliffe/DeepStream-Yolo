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

# The image does not include build tools by default, nor Git.
RUN apt-get install -y build-essential cmake git pkg-config

# --enable-ssl
RUN git clone https://github.com/confluentinc/librdkafka.git -- /tmp/librdkafka && \
    cd /tmp/librdkafka && \
    git checkout tags/v2.2.0 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/librdkafka

ENV DEEPSTREAM_SDK_TBZ2=deepstream_sdk_v7.1.0_jetson
COPY "$DEEPSTREAM_SDK_TBZ2".tbz2 /tmp
RUN tar -C / -xjf /tmp/"$DEEPSTREAM_SDK_TBZ2".tbz2 && \
    /opt/nvidia/deepstream/deepstream/install.sh && \
    rm /tmp/"$DEEPSTREAM_SDK_TBZ2".tbz2 && \
    ldconfig

# Install TensorRT 10 library for DeepStream 7.1 compatibility.
RUN apt-get install -y libnvinfer10

# Clean up.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
