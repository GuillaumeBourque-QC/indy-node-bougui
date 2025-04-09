FROM __NS__/indy-baseimage:0.0.3-master
LABEL maintainer="Hyperledger <hyperledger-indy@lists.hyperledger.org>"

# indy repos
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9692C00E657DDE61 && \
    echo "deb https://hyperledger.jfrog.io/artifactory/indy bionic master" >> /etc/apt/sources.list && \
    apt-get update

COPY scripts/user.sh /usr/local/bin/indy_ci_add_user
RUN bash -c "chmod 755 /usr/local/bin/indy_ci_add_user"

COPY __VERSION_FILE__ /

RUN indy_image_clean
