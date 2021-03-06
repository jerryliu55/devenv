if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="magenta"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$terminfo[bold]$fg[$NCOLOR]%}%n@%m\
%{$reset_color%}:%{$terminfo[bold]$fg[blue]%}%~\
 $(git_prompt_info) \
%{$fg[white]%}
%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}○%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
