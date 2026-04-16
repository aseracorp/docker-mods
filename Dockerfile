# syntax=docker/dockerfile:1

FROM scratch

LABEL maintainer="aseracorp"

# copy local files
COPY root/ /
