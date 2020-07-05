FROM nvidia/cuda:8.0

# Install requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
       git ca-certificates wget && \
    rm -rf /var/lib/apt/lists/*


# set the working directory
WORKDIR /root


RUN git clone https://github.com/Hopobcn/pgi-travis.git && \
    cd pgi-travis && \
    ./install-pgi.sh && \
    cd - && rm -rf pgi-travis

ENV PGI_VERSION 19.10
ENV PGI_INSTALL_DIR "/usr/local/pgi"
ENV PGI_HOME "${PGI_INSTALL_DIR}"/linux86-64/"${PGI_VERSION}"
ENV PGI_BIN_DIR "${PGI_HOME}"/bin
ENV PGI_LIB_DIR "${PGI_HOME}"/lib
ENV PGI_MAN_DIR "${PGI_HOME}"/man

ENV PATH            "${PGI_BIN_DIR}:${PATH}"
ENV LD_LIBRARY_PATH "${PGI_LIB_DIR}:${LD_LIBRARY_PATH}"
ENV MANPATH         "${PGI_MAN_DIR}:${MANPATH}"
