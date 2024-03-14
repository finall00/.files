export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin"

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64/"
export PATH="$PATH:$JAVA_HOME/bin"

ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

### End of Zinit's installer chunk

### SDK-Pi-Pico
export PICO_SDK_PATH=/home/finall/pico/pico-sdk
export PICO_EXAMPLES_PATH=/home/finall/pico/pico-examples
export PICO_EXTRAS_PATH=/home/finall/pico/pico-extras
export PICO_PLAYGROUND_PATH=/home/finall/pico/pico-playground
### End pi pico SDK

### ESP IDF 
export IDF_PATH=/home/finall/ESP/esp-idf
alias get_idf='. $HOME/ESP/esp-idf/export.sh'
### ESP IDF
#Atalhos
export M2_HOME='/opt/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH 



export PATH="$PATH:/opt/nvim-linux64/bin"

#[-f ~/.fzf.bash] && source ~/.fzf.bash
