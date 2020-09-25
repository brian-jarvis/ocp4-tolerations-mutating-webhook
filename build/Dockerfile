FROM registry.redhat.io/ubi8/ubi-minimal:latest

# set labels for metadata
LABEL maintainer="B Jarvis<bjarvis@redhat.com>" \
  name="mutator" \
  description="A Kubernetes mutating webhook server" \
  summary="A Kubernetes mutating webhook server"

# set environment variables
ENV LOCAL_PATH=/usr/local/bin/mutator \
  USER_UID=1001 \
  USER_NAME=mutator

# install sidecar-injector binary
COPY build/_output/bin/tolerations-mutator ${LOCAL_PATH}

# set entrypoint
ENTRYPOINT ["/usr/local/bin/mutator"]

# switch to non-root user
USER ${USER_UID}
