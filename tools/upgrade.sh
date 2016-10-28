
# Use colors, but only if connected to a terminal, and that terminal
# supports them.
tput=$(which tput)
if [ -n "$tput" ]; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

ohBagdoFetch()
{

    printf "${YELLOW}%s\n" "[Oh Bagdo] Checking Version on Background."

    # Print the next twirly character at colume 45
    cd "$BAGDO"
    RESULTGREP=$(git fetch origin master)
    RESULT=$(git status | grep 'up-to-date')

    printf '%s\n' ''
    printf '%s' "${BOLD}" "$RESULTGREP"
    printf '%s' "${BOLD}" "$RESULT"
    printf '%s\n' ' '

    if [[ "$RESULT" =~ .*up-to-date.* ]]
    then
      #printf "${YELLOW}%s\n" "[Oh Bagdo] Hooray! Oh Bagdo has been updated and/or is at the current version."
    else
      printf "${YELLOW}%s${NORMAL}\n" '[Oh Bagdo] Oh Bagdo is not up-to-date.'

      printf '%s\n' '                       '

      printf "${GREEN}%s\n"  "[Oh Bagdo] Would you like to check for updates? [Y/n]: "
      printf '%s' "$NORMAL"

      read line

      if [ "$line" = Y ] || [ "$line" = y ] || [ -z "$line" ]; then
        printf "${YELLOW}%s\n" "[Oh Bagdo] Update now, performing 'git pull origin master'"
        printf '%s\n' '                       '

        RESULT=$(git pull origin master)

        printf "${NORMAL}%s\n" "\n[Oh Bagdo]\n$RESULT"

        printf '%s\n' '                       '

        printf "${YELLOW}%s\n" "[Oh Bagdo] Good Luck ..."

        printf "${Green}%s\n" "[Oh Bagdo] Important Run This Command Now !!!: ${RED}resourceme"
        printf '%s' "$NORMAL"

      else
        printf '%s\n' '                       '
        printf "${YELLOW}%s\n" "[Oh Bagdo] See yaa ..."
        printf '%s' "$NORMAL"

      fi
    fi

    cd ~/

    printf "${GREEN}%s\n"  "[Oh Bagdo] Press [Enter] To Continue: "
    read line

}

ohBagdoLogo()
{
  printf "${YELLOW}%s${NORMAL}\n" "Starting Oh Bagdo"
  printf '%s\n' '                                                   '
  printf '%s' "$GREEN"
  printf '%s\n' '                                                   '
  printf '%s\n' ' ▒█████   ██░ ██     ▄▄▄▄    ▄▄▄        ▄████ ▓█████▄  ▒█████   '
  printf '%s\n' '▒██▒  ██▒▓██░ ██▒   ▓█████▄ ▒████▄     ██▒ ▀█▒▒██▀ ██▌▒██▒  ██▒ '
  printf '%s\n' '▒██░  ██▒▒██▀▀██░   ▒██▒ ▄██▒██  ▀█▄  ▒██░▄▄▄░░██   █▌▒██░  ██▒ '
  printf '%s\n' '▒██   ██░░▓█ ░██    ▒██░█▀  ░██▄▄▄▄██ ░▓█  ██▓░▓█▄   ▌▒██   ██░ '
  printf '%s\n' '░ ████▓▒░░▓█▒░██▓   ░▓█  ▀█▓ ▓█   ▓██▒░▒▓███▀▒░▒████▓ ░ ████▓▒░ '
  printf '%s\n' '░ ▒░▒░▒░  ▒ ░░▒░▒   ░▒▓███▀▒ ▒▒   ▓▒█░ ░▒   ▒  ▒▒▓  ▒ ░ ▒░▒░▒░  '
  printf '%s\n' '░ ▒ ▒░  ▒ ░▒░ ░   ▒░▒   ░   ▒   ▒▒ ░  ░   ░  ░ ▒  ▒   ░ ▒ ▒░    '
  printf '%s\n' '░ ░ ░ ▒   ░  ░░ ░    ░    ░   ░   ▒   ░ ░   ░  ░ ░  ░ ░ ░ ░ ▒   '
  printf '%s\n' '    ░ ░   ░  ░  ░    ░            ░  ░      ░    ░        ░ ░   '
  printf '%s\n' '                     ░                      ░                   '
  printf '%s\n' '                                                                '
  printf '%s\n' '▒█░░░ ▀█▀ ▒█░▄▀ ▒█▀▀▀ 　 ░█▀▀█ 　 ▒█▀▀█ ▒█▀▀▀█ ▒█▀▀▀  ▒█▀▀▀      '
  printf '%s\n' '▒█░░░ ▒█░ ▒█▀▄░ ▒█▀▀▀ 　 ▒█▄▄█ 　 ▒█▀▀▄ ▒█░░▒█ ░▀▀▀▄   ░▀▀▀▄     '
  printf '%s\n' '▒█▄▄█ ▄█▄ ▒█░▒█ ▒█▄▄▄ 　 ▒█░▒█ 　 ▒█▄▄█ ▒█▄▄▄█ ▒█▄▄▄█▒█▄▄▄█      '
  printf '%s\n' '                                                                '
  printf '%s\n' ' version 1.2.0'
  printf '%s\n' '                                                                '
  printf '%s' "$NORMAL"
}


ohBagdoLogo

ohBagdoFetch &



