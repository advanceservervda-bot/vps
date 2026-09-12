FROM ubuntu:22.04

# Update sistem dan install SSH server & sudo
RUN apt-get update && apt-get install -y openssh-server sudo

# Setup folder untuk jalannya SSH
RUN mkdir /var/run/sshd

# Buat user 'dwikuyz00' dan atur passwordnya menjadi 'dwikuyz00'
RUN useradd -m -s /bin/bash dwikuyz00
RUN echo 'dwikuyz00:dwikuyz00' | chpasswd

# Berikan hak akses admin (sudo) kepada user dwikuyz00
RUN usermod -aG sudo dwikuyz00

# Izinkan login menggunakan password
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Buka port 22
EXPOSE 22

# Jalankan SSH Server
CMD ["/usr/sbin/sshd", "-D"]
