FROM node:24-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=npm depName=cspell
ENV CSPELL_VERSION="9.6.0"

# Install tools
#    Git     https://git-scm.com/
#    Make    https://www.gnu.org/software/make/
#    Task    https://taskfile.dev/
RUN curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash && \
    apt update && \
    apt-get install -y git tzdata make task && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install --global npm@latest \
    cspell@${CSPELL_VERSION} \
    @cspell/dict-aws \
    @cspell/dict-bash \
    @cspell/dict-companies \
    @cspell/dict-data-science \
    @cspell/dict-docker \
    @cspell/dict-en-gb \
    @cspell/dict-en-common-misspellings \
    @cspell/dict-es-es \
    @cspell/dict-git \
    @cspell/dict-google \
    @cspell/dict-golang \
    @cspell/dict-lorem-ipsum \
    @cspell/dict-makefile \
    @cspell/dict-python \
    @cspell/dict-shell \
    @cspell/dict-software-terms \
    @cspell/dict-terraform

RUN cspell link add @cspell/dict-aws && \
    cspell link add @cspell/dict-bash && \
    cspell link add @cspell/dict-companies && \
    cspell link add @cspell/dict-data-science && \
    cspell link add @cspell/dict-docker && \
    cspell link add @cspell/dict-en-gb && \
    cspell link add @cspell/dict-en-common-misspellings && \
    cspell link add @cspell/dict-es-es && \
    cspell link add @cspell/dict-git && \
    cspell link add @cspell/dict-google && \
    cspell link add @cspell/dict-golang && \
    cspell link add @cspell/dict-lorem-ipsum && \
    cspell link add @cspell/dict-makefile && \
    cspell link add @cspell/dict-python && \
    cspell link add @cspell/dict-shell && \
    cspell link add @cspell/dict-software-terms && \
    cspell link add @cspell/dict-terraform
