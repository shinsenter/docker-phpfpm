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

ARG  BUILD_FROM_IMAGE=${BUILD_FROM_IMAGE:-php}
ARG  PHP_VERSION=${PHP_VERSION:-8.4}
ARG  PHP_VARIANT=${PHP_VARIANT:-fpm-alpine}

FROM ${BUILD_FROM_IMAGE}:${PHP_VERSION}-${PHP_VARIANT}
ARG  BUILDKIT_SBOM_SCAN_STAGE=true

# set PHP variables
ARG PHP_VERSION=${PHP_VERSION:-8.4}
ENV PHP_VERSION=${PHP_VERSION//-rc/}

################################################################################

INCLUDE ./common/os-base
INCLUDE ./common/os-crontab
INCLUDE ./common/php-extensions
INCLUDE ./common/php-composer
INCLUDE ./common/php-ini-directives

################################################################################

INCLUDE ./meta

################################################################################
