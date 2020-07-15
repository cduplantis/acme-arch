
FROM maven:3-jdk-8 as build

ENV MAVEN_CONFIG=/usr/.m2
WORKDIR /usr/src/app
RUN git clone --depth=1 https://github.com/plantuml/plantuml-server.git  /usr/src/app \
    && mkdir -p /usr/.m2 && chmod -R a+w /usr/.m2 && chmod -R a+w /usr/src/app \
    && cd /usr/src/app \
    && mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git openssh-client less iproute2 procps lsb-release \
    #
    # Install GraphViz
    && apt-get install -y graphviz fonts-wqy-zenhei \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /plantuml-server
COPY --from=build /usr/src/app/target/dependency /plantuml-server/dependency
COPY --from=build /usr/src/app/target/plantuml.war /plantuml-server/plantuml.war

COPY plantuml /plantuml-server/bin/plantuml
COPY plantumld /plantuml-server/bin/plantumld
RUN chmod a+x /plantuml-server/bin/plantuml \
    && ln -s /plantuml-server/bin/plantuml /usr/bin/plantuml \
    && chmod a+x /plantuml-server/bin/plantumld \
    && ln -s /plantuml-server/bin/plantumld /usr/bin/plantumld

EXPOSE 8080

COPY ./docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["plantumld", "start"]

