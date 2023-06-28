#!/usr/bin/env bash

# Inside container, create a new site including a theme
SITE_NAME="access-intech.de"
THEME_GIT_URL="https://github.com/devcows/hugo-universal-theme.git"
THEME_NAME=$(awk -F/ '{print $NF}' <<<"${THEME_GIT_URL}" | sed 's/.git//')

REQUIREMENTS=(git hugo)
for r in "${REQUIREMENTS[@]}"; do
  if ! type "${r}" &>/dev/null; then
    echo "Missing requirement: '${r}'"
    exit 1
  fi
done

# Create a new branch
git checkout -b "${SITE_NAME}"
# Create a new site
hugo new site "${SITE_NAME}" && cd "${SITE_NAME}"
# Clone Theme
git submodule add "${THEME_GIT_URL}" "./themes/${THEME_NAME}"
# Copy example content to productive content
cp -aR ./themes/${THEME_NAME}/exampleSite/{content,data,static,*.toml} .
# Backup hugo.toml
mv hugo.toml{,.ORI}
# Renaming config.toml to hugo.toml
mv config.toml hugo.toml
# Find empty directories and add a '.keep' file for git
find . -maxdepth 1 -mindepth 1 -type d | while read d; do
  cd $d || exit 1
  if ! ls -1qA | grep -q .; then touch .keep; fi
  cd -
done
