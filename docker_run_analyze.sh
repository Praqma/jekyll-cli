#!/usr/bin/env bash

# The Set Builtin
# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
[ "$DEBUG" == 'true' ] && set -x

source .environment

docker run \
  --rm \
  --tty \
  --volume $JEKYLL_SITE_DIR:/website:rw \
  --workdir /website \
  $DOCKER_IMAGE_NAME_LATEST \
  bash -c " \
    ruby --version && \
    analyze \
      --source /website \
      --copies /opt/static-analysis/template_report_duplication.html \
      --unused /opt/static-analysis/template_report_usage.html
    "
