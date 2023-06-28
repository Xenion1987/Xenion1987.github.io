# devcontainer-hugo

```bash
# Clone this repository as starting point
BRANCH_NAME=""
git clone -b ${BRANCH_NAME:-main} --recursive https://github.com/Xenion1987/Xenion1987.github.io.git
```

Inside the contianer, check [init.sh](./init.sh)

## Install `aafu` theme requirements

The `aafu` theme has some requirements which has to installed via `npm`.

```bash
cd Xenion1987.github.io/themes/aafu
npm i
npm audit fix
```

## Other useful commands

```bash
SITE_NAME="Xenion1987.github.io"
git submodule add --force https://github.com/darshanbaral/aafu "${SITE_NAME:?}/themes/aafu"
```

```bash
git submodule init
git submodule update
```
