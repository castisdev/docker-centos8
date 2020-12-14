# Pull base image
FROM centos:8

RUN yum install -y centos-release-stream; yum -y clean all

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl-devel \
  git \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  valgrind \
  mariadb-devel \
  postgresql-server-devel \
  curl-devel \
  xz \
  file \
  vim-enhanced \
  unixODBC-devel \
  mariadb-connector-odbc \
  sysstat \
  psmisc \
  yum-utils \
  tbb-devel \
  gperftools-devel \
  iproute \
  net-tools \
  ccache \
  libunwind-devel; \
  yum -y clean all

ADD install_gcctoolset9.sh /script/
RUN /script/install_gcctoolset9.sh
SHELL [ "scl", "enable", "gcc-toolset-9" ]

ADD install_cmake3191.sh /script/
RUN /script/install_cmake3191.sh

ADD install_libbacktrace.sh /script/
RUN /script/install_libbacktrace.sh

ADD install_boost175.sh /script/
RUN /script/install_boost175.sh
ENV Boost_DIR /usr/local/boost_1_75_0

ADD install_cryptopp820.sh /script/
RUN /script/install_cryptopp820.sh

ADD install_googletest1100.sh /script/
RUN /script/install_googletest1100.sh

ADD install_python.sh /script/
RUN /script/install_python.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck23.sh /script/
RUN /script/install_cppcheck23.sh

ADD install_zsh58.sh /script/
RUN /script/install_zsh58.sh

ADD install_ninja1102.sh /script/
RUN /script/install_ninja1102.sh

ADD install_ffmpeg431.sh /script/
RUN /script/install_ffmpeg431.sh

# set timezone
RUN ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# ctail
RUN wget -O - https://raw.githubusercontent.com/castisdev/ctail/master/install.sh --no-check-certificate | bash

# Add root files
ADD ./.bashrc /root/.bashrc

# Set environment variables
ENV HOME /root

# Define default command
CMD ["scl", "enable", "gcc-toolset-9", "zsh"]
