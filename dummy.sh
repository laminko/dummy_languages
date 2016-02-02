# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
#
# aliases
alias grpe=grep
alias grep='grep --color --line-number'
alias vim="vim -p"
 alias rebash="source ~/.bashrc"

 alias install='sudo apt-get -y install'
 alias search='apt-cache search'
 alias purge='sudo apt-get purge'

 export EDITOR=vim

 # set up the prompt to the hostname
 shopt -s checkwinsize
 PS1="\e[1;35m[\w]   ---   \@ \d \n$>\[\e[0m\]"
 PS2="\e[1;35m->\[\e[0m\]"

 #--------------------------------------------------
 #    grabs some definitions from google
 #--------------------------------------------------
 define () {
  lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}" | grep -m 25 -w "*"  | sed 's/;/ -/g' | cut -d- -f5 > /tmp/templookup.txt
              if [[ -s  /tmp/templookup.txt ]] ;then
                  until ! read response
                      do
                      echo "${response}"
                      done < /tmp/templookup.txt
                  else
                      echo "Sorry $USER, I can't find the term \"${1} \""
               fi
   rm -f /tmp/templookup.txt
 }

 #--------------------------------------------------
 #    Extracts most files, mostly
 #--------------------------------------------------
 extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      rar x $1      ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
 }
 
