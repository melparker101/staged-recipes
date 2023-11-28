#!/usr/bin/env bash

#Simply copy data directory from source to intended location in PREFIX.

set -eux

SRCDIR="$PWD/src"
SRCDATADIR="${SRCDIR}/mcstas-comps/data"
DESTDATADIR="${PREFIX}/share/mcstas/resources/data"

#Sanity checks:
test -d "${PREFIX}"
test -d "${SRCDIR}"
test -f "${SRCDIR}/CMakeLists.txt"
test -d "${SRCDATADIR}"
test -f "${SRCDATADIR}/Al.laz"
test -n "${PKG_VERSION}"

#Now simply copy over all the data files:
mkdir -p "${DESTDATADIR}"
cp -rp "${SRCDATADIR/"* "${DESTDATADIR}"/

#Ensure consistent permissions on all installed files:
find "${DESTDATADIR}"/ -type d -exec chmod 755 {} \;
find "${DESTDATADIR}"/ -type f -exec chmod 644 {} \;
