# devcontainer-hugo

```bash
# Clone this repository as starting point
BRANCH_NAME=""
git clone -b ${BRANCH_NAME:-main} --recursive https://github.com/Xenion1987/devcontainer-hugo.git
```

Inside the contianer, check [init.sh](./init.sh)

## Other useful commands

```bash
SITE_NAME=""
git submodule add --force https://github.com/devcows/hugo-universal-theme.git "${SITE_NAME:?}/themes/hugo-universal-theme"
```

```bash
git submodule init
git submodule update
```
