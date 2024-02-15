# syntax = devthefuture/dockerfile-x
################################################################################
# The setups in this file belong to the project https://code.shin.company/php
# I appreciate you respecting my intellectual efforts in creating them.
# If you intend to copy or use ideas from this project, please credit properly.
# Author:  Mai Nhut Tan <shin@shin.company>
# License: https://code.shin.company/php/blob/main/LICENSE
################################################################################

ARG  PHP_VERSION=${PHP_VERSION:-8.3}
ARG  PHP_VARIANT=${PHP_VARIANT:-fpm-alpine}

FROM ./base-php as php

################################################################################

INCLUDE ./with-apache/apache-install
INCLUDE ./with-apache/apache-config

################################################################################

EXPOSE 80
EXPOSE 443
EXPOSE 443/udp

CMD []

################################################################################

LABEL traefik.enable=true
