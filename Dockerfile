FROM perl:5.30.1

USER root

RUN apt-get update && \
    apt-get install -y \ 
    r-base git-hub rpm

RUN cpan Parallel::ForkManager
WORKDIR /opt

RUN wget https://github.com/mikesovic/AftrRAD/archive/master.zip && unzip master.zip

RUN wget https://www.niehs.nih.gov/research/resources/assets/docs/acana_linux_x64.tgz && \
    tar -xzf acana_linux_x64.tgz && \
    mv ACANA_DIR/ACANA AftrRAD-master/AftrRADv5.0.0.1 && \
    mv ACANA_DIR/dnaMatrix AftrRAD-master/AftrRADv5.0.0.1

RUN wget https://mafft.cbrc.jp/alignment/software/mafft_7.450-1_amd64.deb && \
    dpkg  -i mafft_7.450-1_amd64.deb && exit

WORKDIR AftrRAD-master/AftrRADv5.0.0.1
