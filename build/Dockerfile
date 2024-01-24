FROM golang:1.20.13-bullseye 

RUN apt-get update

# -------------------
# ANSIBLE
# -------------------

# install required packages and tools
RUN apt-get         \
  install -y        \
  ansible           \
  ssh               \
  python3-jmespath 

# -------------------
# DISTROBUILDER
# -------------------

# install required packages and tools
RUN apt-get         \
  install -y        \
  golang-go         \
  debootstrap       \
  rsync             \
  gpg               \
  squashfs-tools    \
  git               \
  make              \
  xz-utils

# build and install - distrobuilder
RUN git clone https://github.com/lxc/distrobuilder 
RUN make -C ./distrobuilder
RUN ln -s /go/bin/distrobuilder /usr/bin/distrobuilder
