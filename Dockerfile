FROM centos:8

RUN yum -y install wget epel-release
RUN yum -y install debootstrap.noarch squashfs-tools openssl-devel     libuuid-devel libseccomp-devel cryptsetup-luks
RUN yum -y groupinstall 'Development Tools'
RUN if [[ $(uname -m) == "aarch64" ]]; then arch="arm64"; else arch="amd64"; fi && \
	 wget https://dl.google.com/go/go1.13.linux-$arch.tar.gz && \
	tar --directory=/usr/local -xzvf go1.13.linux-$arch.tar.gz && \
	rm -f go1.13.linux-$arch.tar.gz

RUN wget https://github.com/singularityware/singularity/releases/download/v3.5.3/singularity-3.5.3.tar.gz && \
	tar -xzvf singularity-3.5.3.tar.gz && \
	cd singularity && \
        export PATH=/usr/local/go/bin:$PATH && \
	./mconfig && \
	cd builddir/ && \
	make && make install

ENTRYPOINT ["/usr/local/bin/singularity"]
