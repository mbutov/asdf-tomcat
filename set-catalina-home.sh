#!/usr/bin/env sh

catalina_sh_path="$(asdf which catalina.sh)"
if [ -n "${catalina_sh_path}" ]; then
  export CATALINA_HOME
  CATALINA_HOME=$(echo "${catalina_sh_path}" | sed "s/\/bin\/catalina.sh$//")
fi
