if [ -e /opt/homebrew-cask/Caskroom/atom/latest/Atom.app ]; then
  export ATOM_PATH=/opt/homebrew-cask/Caskroom/atom/latest/
fi
if [ -e /opt/Atom ]; then
  export ATOM_PATH=/opt/Atom
  export APM_PATH=${ATOM_PATH}/resources/app/apm/node_modules/atom-package-manager/bin/
  export PATH="${ATOM_PATH}:${APM_PATH}:${PATH}"
fi
