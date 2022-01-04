FROM centos:8

RUN yum -y install wget epel-release
RUN yum -y install debootstrap.noarch squashfs-tools openssl-devel     libuuid-devel libseccomp-devel cryptsetup-luks
RUN yum -y groupinstall 'Development Tools'
RUN wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz && \
	tar --directory=/usr/local -xzvf go1.13.linux-amd64.tar.gz && \
	rm -f go1.13.linux-amd64.tar.gz

RUN wget https://github.com/singularityware/singularity/releases/download/v3.5.3/singularity-3.5.3.tar.gz && \
	tar -xzvf singularity-3.5.3.tar.gz && \
	cd singularity && \
        export PATH=/usr/local/go/bin:$PATH && \
	./mconfig && \
	cd builddir/ && \
	make && make install

