# Function to display virtual environment info
virtualenv_info() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%{$fg_bold[magenta]%}[ $(basename $VIRTUAL_ENV)]%{$reset_color%} "
  fi
}

# Base prompt
PROMPT='
%{$fg_bold[cyan]%} $(whoami)%{$reset_color%} $(git_prompt_info)
'

# Add virtual environment info to the prompt
PROMPT+='$(virtualenv_info)'

# Add conditional prompt symbol based on the last command's exit status
PROMPT+='%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)%{$reset_color%} %{$fg_bold[cyan]%}󰉋 %1~%{$reset_color%} '

# Git prompt configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}➜ %{$fg_bold[blue]%}󰊢 git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Disable default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

