echo '>> Updating packages'
doas env \
  PKG_PATH=./:installpath \
  TRUSTED_PKG_PATH=/home/ports/packages/$(uname -m)/all \
  pkg_add -u || :
