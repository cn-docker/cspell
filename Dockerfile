FROM node:24-bookworm
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# renovate: datasource=npm depName=cspell
ENV CSPELL_VERSION="9.7.0"

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
    @cspell/dict-en-gb \
    @cspell/dict-en-gb-ise \
    @cspell/dict-scientific-terms-gb \
    @cspell/dict-es-es \
    @cspell/dict-en-slang \
    @cspell/dict-people-names \
    @cspell/dict-redis \
    @cspell/dict-scientific-terms-us \
    @cspell/dict-vim

RUN cspell link add @cspell/dict-en-gb && \
    cspell link add @cspell/dict-en-gb-ise && \
    cspell link add @cspell/dict-scientific-terms-gb && \
    cspell link add @cspell/dict-es-es && \
    cspell link add @cspell/dict-en-slang && \
    cspell link add @cspell/dict-people-names && \
    cspell link add @cspell/dict-redis && \
    cspell link add @cspell/dict-scientific-terms-us && \
    cspell link add @cspell/dict-vim
