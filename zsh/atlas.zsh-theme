local user='%F{magenta}%n@%m%f'
local pwd='%B%F{blue}%~%f%b'

PROMPT='${user} ${pwd} $(git_prompt_info) $(git_prompt_status)
\$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{red}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%F{red}+%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{red}!%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}x%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{red}>%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{red}=%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}*%f"
