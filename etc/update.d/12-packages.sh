echo '>> Updating packages'
doas env \
  PKG_PATH=./:installpath \
  TRUSTED_PKG_PATH=/home/ports/packages/`arch -s`/all \
  pkg_add -u || :
