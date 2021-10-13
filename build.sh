#!/bin/bash
VERSION=1.8.4
podman build . -t quay.io/gpte-devops-automation/ocvault:${VERSION}
podman tag quay.io/gpte-devops-automation/ocvault:${VERSION} quay.io/gpte-devops-automation/ocvault:latest
podman push quay.io/gpte-devops-automation/ocvault:${VERSION}
podman push quay.io/gpte-devops-automation/ocvault:latest
