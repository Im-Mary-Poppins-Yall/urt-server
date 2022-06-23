#!/usr/bin/env bash

export BLACK='\e[0;30m'
export BLUE='\e[0;34m'
export GREEN='\e[0;32m'
export CYAN='\e[0;36m'
export RED='\e[0;31m'
export PURPLE='\e[0;35m'
export YELLOW='\e[0;33m'
export WHITE='\e[0;37m'
export DEFAULT='\e[0m'

main() (
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

  shuffled="$(shuf < "${dir}/q3ut4/mapcycle_unshuffled.txt")"
  firstMap="$(head -1 <<< "${shuffled}")"

  printf '%bShuffling map cycle%b\n' "${CYAN}" "${DEFAULT}"
  printf '%s\n' "${shuffled}" > "${dir}/q3ut4/mapcycle.txt"

  printf '%bRCON password: %b' "${CYAN}" "${DEFAULT}"
  read -r rconPassword
  export RCON_PASSWORD="${rconPassword}"
  printf '\n'

  printf '%bCreating server config%b\n' "${CYAN}" "${DEFAULT}"
  {
    printf '%s\n\n' "$(< "${dir}/q3ut4/server_no_map.cfg")"
    printf 'map %s\n' "${firstMap}"
  } | envsubst "\$RCON_PASSWORD" > "${dir}/q3ut4/server.cfg"
  printf 'The first map will be %s\n' "${firstMap}"
)

main
