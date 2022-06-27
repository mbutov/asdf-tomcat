#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="tomcat"
TOOL_TEST="catalina.sh version"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)
tomcat_archive_url=https://archive.apache.org/dist/tomcat/

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1n -k 2,2n -k 3,3n | awk '{print $2}'
}

list_all_versions() {
  local versions
  versions=
  for value in 10 9 8 7 6; do
    versions="$versions $(list_versions "$value")"
  done
  echo "$versions" | xargs | tr " " "\n"
}

list_versions() {
  local major_version
  major_version=$1
  curl "${curl_opts[@]}" "${tomcat_archive_url}/tomcat-${major_version}/" |
    grep -o -P "<a href=\"v${major_version}(\.\d+)+/\">" |
    grep -o -P "${major_version}(\.\d+)+" |
    tr "\n" " " |
    xargs
}

download_release() {
  local version major_version filename url
  version="$1"
  filename="$2"
  major_version=$(echo "$version" | cut -d . -f 1)

  url="${tomcat_archive_url}/tomcat-${major_version}/v${version}/bin/apache-tomcat-${version}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
    echo "Tomcat path: $install_path"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
