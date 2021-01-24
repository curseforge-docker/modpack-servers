#!/bin/bash

## Check if manifest.json exists, exit if it does not exist
if [ ! -f "manifest.json" ]; then
  echo "## No manifest.json found, probably no files to download.."
  exit 0
fi

OVERRIDES_DIR=$(cat manifest.json | jq -r .overrides)

if [ ! -z "${OVERRIDES_DIR}" ] && [ "${OVERRIDES_DIR}" != "null" ] && [ -d "./${OVERRIDES_DIR}" ]; then
  mv "./${OVERRIDES_DIR}/"* ./
  rm -r "./${OVERRIDES_DIR}"
fi

## Function to download mod files from manifest.json
function downloadFile {
  if [[ $# != 2 ]]; then
    echo "Not enough arguments to download file"
    return
  fi

  ## Change to mods directory
  cd mods

  ## Get download url for mod file
  MOD_FILE_URL=$(curl -sL "https://addons-ecs.forgesvc.net/api/v2/addon/${1}/file/${2}/download-url")

  echo "# Downloading mods/$(basename "$MOD_FILE_URL")"
  curl -sSLOJ "$MOD_FILE_URL"
}

## Make downloadFile function accessible for xargs call
export -f downloadFile

# Create mods directory if it does not exist
[ ! -d "mods" ] && mkdir "mods"

# Download all mod files to mods directory
cat manifest.json | \
    jq -r '.files[] | (.projectID|tostring) + " " + (.fileID|tostring)' | \
    xargs -n 1 -P 10 -I {} bash -c 'downloadFile $@' _ {}
