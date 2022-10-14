FROM quay.io/fedora/fedora:latest
#FROM registry.access.redhat.com/ubi8/ubi:latest

LABEL Author="Daniel Abreu"
LABEL Email="daniel@deabreu.co.za"

# Install requirements.
RUN dnf makecache --timer \
  && dnf -y install initscripts \
  && dnf -y update \
  && dnf -y install \
  wget \
  gcc \
  git \
  unzip \
  curl \
  ansible && dnf clean all

# Create a folder
RUN mkdir actions-runner
WORKDIR /actions-runner


# Download the latest runner package
RUN wget https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz -O - | tar -xz -C /actions-runner

RUN /actions-runner/bin/installdependencies.sh

# add over the start.sh script
COPY start.sh /actions-runner/
RUN chmod +x /actions-runner/start.sh

# Add ENV to be pass to shell script
ENV RUNNER_TOKEN=SECRET
ENV REPO_URL=REPO

# set the entrypoint to the start.sh script
ENTRYPOINT [ "./start.sh" ]