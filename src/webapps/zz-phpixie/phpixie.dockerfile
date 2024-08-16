# syntax = devthefuture/dockerfile-x:1.4.2
################################################################################
# The setups in this file belong to the project https://code.shin.company/php
# I appreciate you respecting my intellectual efforts in creating them.
# If you intend to copy or use ideas from this project, please credit properly.
# Author:  SHIN Company <shin@shin.company>
# License: https://code.shin.company/php/blob/main/LICENSE
################################################################################

# Enable SBOM attestations
# See: https://docs.docker.com/build/attestations/sbom/
ARG  BUILDKIT_SBOM_SCAN_CONTEXT=true

################################################################################

ARG  BUILD_FROM_IMAGE=${BUILD_FROM_IMAGE:-shinsenter/phpfpm-apache}
ARG  BUILD_TAG_PREFIX=${BUILD_TAG_PREFIX:-}

ARG  PHP_VERSION=${PHP_VERSION:-8.4}
ARG  PHP_VARIANT=${PHP_VARIANT:-}

FROM ${BUILD_FROM_IMAGE}:${BUILD_TAG_PREFIX}php${PHP_VERSION}${PHP_VARIANT}
ARG  BUILDKIT_SBOM_SCAN_STAGE=true
ONBUILD RUN if has-cmd autorun; then autorun /etc/onbuild.d/; fi

################################################################################

ADD --link ./rootfs/ /

################################################################################

# https://phpixie.com/quickstart.html
ENV DOCUMENT_ROOT="/web"
ENV DISABLE_AUTORUN_GENERATING_INDEX=1
RUN env-default INITIAL_PROJECT "phpixie/project"

################################################################################

RUN web-cmd phpixie 'php $(app-path)/console'

################################################################################

INCLUDE ./meta

################################################################################
