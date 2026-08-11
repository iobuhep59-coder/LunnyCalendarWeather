#!/bin/sh
set -eu
BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
VERSION=8.10.2
DIST="$HOME/.gradle/wrapper/dists/gradle-$VERSION-bin"
GRADLE_HOME="$DIST/gradle-$VERSION"
if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$DIST"
  TMP="$DIST/gradle-$VERSION-bin.zip"
  if [ ! -f "$TMP" ]; then
    echo "Скачиваю Gradle $VERSION..."
    if command -v curl >/dev/null 2>&1; then curl -fL --retry 3 "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip" -o "$TMP"; else wget -O "$TMP" "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"; fi
  fi
  rm -rf "$DIST/unpacked"
  mkdir -p "$DIST/unpacked"
  unzip -q "$TMP" -d "$DIST/unpacked"
  mv "$DIST/unpacked/gradle-$VERSION" "$GRADLE_HOME"
  rm -rf "$DIST/unpacked"
fi
exec "$GRADLE_HOME/bin/gradle" -p "$BASE_DIR" "$@"
