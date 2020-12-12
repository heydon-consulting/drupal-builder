#!/bin/sh

baseDockerfile=Dockerfile.template
versions=('7.1' '7.2' '7.3' '7.4')

generated_warning() {
  cat <<-EOH
#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
EOH
}

for version in "${versions[@]}"; do
  [ -d "$version" ] || continue

  echo "Generating $version/Dockerfile from $baseDockerfile"
  
  { generated_warning; cat "$baseDockerfile"; } > "$version/Dockerfile"
  
  gsed -ri \
    -e 's!%%PHP_VERSION%%!'"$version"'!' \
    "$version/Dockerfile"
done
