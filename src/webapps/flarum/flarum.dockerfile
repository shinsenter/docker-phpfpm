# syntax = devthefuture/dockerfile-x
################################################################################
# The setups in this file belong to the project https://code.shin.company/php
# I appreciate you respecting my intellectual efforts in creating them.
# If you intend to copy or use ideas from this project, please credit properly.
# Author:  Mai Nhut Tan <shin@shin.company>
# License: https://code.shin.company/php/blob/main/LICENSE
################################################################################

ARG  BUILD_FROM_IMAGE=${BUILD_FROM_IMAGE:-shinsenter/phpfpm-apache}
ARG  PHP_VERSION=${PHP_VERSION:-8.3}
ARG  PHP_VARIANT=${PHP_VARIANT:-}

FROM ${BUILD_FROM_IMAGE}:php${PHP_VERSION}${PHP_VARIANT}

################################################################################

INCLUDE ./meta

ADD --link ./rootfs/ /

################################################################################

# https://docs.flarum.org/install/
ENV DOCUMENT_ROOT="/public"
ENV INITIAL_PROJECT="flarum/flarum"
ENV DISABLE_GENERATING_INDEX=1

################################################################################

RUN web-cmd flarum 'php $(app-path)/flarum'
