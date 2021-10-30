#!/usr/bin/env bash

ALPINE_VERSIONS=( 3.11 3.12 3.13 3.14 )
GCC_VERSIONS=( 11.1.0 11.2.0 )

set -o xtrace

for ALPINE_VERSION in "${ALPINE_VERSIONS[@]}" ; do
  for GCC_VERSION in "${GCC_VERSIONS[@]}" ; do
    make release ALPINE_VERSION=${ALPINE_VERSION} GCC_VERSION=${GCC_VERSION} 
  done
done
