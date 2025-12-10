# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
ARG BASE_IMAGE=ghcr.io/ublue-os/ucore:stable-zfs@sha256:8bbfb5fdfb357adfd3d8ef28cc13f8eddd1e1b7afaa6f4ac47b4e61933ea2f8a
FROM ${BASE_IMAGE:-ghcr.io/ublue-os/ucore:stable-zfs}

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint