git clone https://github.com/confluentinc/librdkafka.git -- /tmp/librdkafka
pushd /tmp/librdkafka
git checkout tags/v2.2.0
# --prefix=/opt/nvidia/deepstream/deepstream/lib
./configure --enable-ssl
make
sudo make install
popd
