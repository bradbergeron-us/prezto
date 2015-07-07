# ----------------------------------------------------
#   Git Aliases
# ----------------------------------------------------

# ----- Settings ----- #

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

# ----- Aliases ----- #

alias g='git'

# Add (a)
alias ga='git add'
alias gac='git add . && git commit'
alias gacv='git add . && git commit --verbose'
alias gap='git add -p'
alias gast='git add . && git stash save'

# Branch (b)
alias gb='git branch'
alias gba='git branch -a'
alias gbL='git branch -av'
alias gbc='git checkout -b'
alias gbx='git branch -d'
alias gbd='git branch -D'
alias gbX='git branch -D'
alias gbdr='git push origin --delete'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gbr='git branch -r'
alias gbs='git show-branch'
alias gbS='git show-branch -a'

# Commit (c)
# alias gc='git commit'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcam='git commit -a -m'
alias gce='git commit --amend'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcl='git-commit-lost'
alias gcm='git commit --message'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcv='git commit --verbose'

# Checkout (co)
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcO='git checkout --patch'

# Conflict (C)
alias gCl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gCa='git add $(gCl)'
alias gCe='git mergetool $(gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo $(gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt $(gCl)'

# Diff (d)
alias gd='git diff'
alias gdc='git diff --stat --color'
alias gdcn='git diff --name-status'
alias gdcs='git shortlog'
alias gds='git diff --staged'
alias gdst='git diff --stat'
alias gdt='git difftool'
alias gfb='git checkout -b'

# Data Listing (D)
alias gD='git ls-files'
alias gDc='git ls-files --cached'
alias gDx='git ls-files --deleted'
alias gDm='git ls-files --modified'
alias gDu='git ls-files --other --exclude-standard'
alias gDk='git ls-files --killed'
alias gDi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='git fetch'
alias gfc='git clone'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Grep (g)
alias gg='git grep'
alias ggi='git grep --ignore-case'
alias ggl='git grep --files-with-matches'
alias ggL='git grep --files-without-matches'
alias ggv='git grep --invert-match'
alias ggw='git grep --word-regexp'

# Graph (g)
alias ggl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative -15'
alias gga='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias ggo='git log --oneline --stat'
alias ggy='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --since yesterday'

# Hub (h)
alias h='hub'
alias hb='hub browse'
alias hc='hub clone'
alias hpr='hub pull-request'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'

# Log (l)
alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
alias glc='git shortlog --summary --numbered'

# Pull (l)
alias gl='git pull'
alias glr='git pull --rebase'

# Merge (m)
alias gm='git merge'
alias gma='git merge --abort'
alias gmt='git mergetool'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gmff='git merge --no-ff'
alias gmm='git merge master'

# Pull (pp)
alias gpp='git pull --rebase && git push'
alias gppt='git pull --rebase && git push && git push --tags'
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Push (p)
alias gp='git push'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpf='git push --force'
alias gpa='git push --all'
alias gpA='git push --all && git push --tags'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpt='git push --tags'
alias gptb='git push -u origin'

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

# Remote (r)
alias grpd='git remote prune origin --dry-run'
alias grp='git remote prune origin'

# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub-browse'

# Reset (r)
alias grd='git reset --hard'
alias grh='git reset HEAD^'

# Status (s)
alias gs='git status'
alias gss='git status -sb'

# Stash (st)
alias gst='git stash'
alias gsta='git stash apply'
alias gsts='git stash save'
alias gsts='git stash save --include-untracked'
alias gstS='git stash save --patch --no-keep-index'
alias gstw='git stash save --include-untracked --keep-index'
alias gstd='git stash drop stash@{0}'
alias gsth='git stash show'
alias gstd='git stash show --patch --stat'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstx='git stash drop'
alias gstL='git-stash-dropped'
alias gstr='git-stash-recover'
alias gstX='git-stash-clear-interactive'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSm='git-submodule-move'
alias gSs='git submodule sync'
alias gSu='git submodule foreach git pull origin master'
alias gSx='git-submodule-remove'

# Working Copy (w)
alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'

# Tag (t)
alias gt='git tag'
alias gtd='git tag -d'

# Update Index (ui)
alias gui='git update-index --assume-unchanged'

# Show (w)
alias gw='git show'

# Underscore Functions
alias git_author_commits='git shortlog --summary --numbered'
alias git_config_vars='git config --global -l'
alias git_current_tag='git describe --abbrev=0 --tags'
alias git_push_deploy='git pull --rebase && git push && rake deploy'
alias git_standup="git log --since yesterday --author='$USERNAME' --pretty=oneline"
alias git_today="git log --since=midnight --author='$NAME' --oneline"
alias git_update_submodules='git submodule foreach git pull'
# Push all repositories (even submodules)
alias git_push_all='git push --recurse-submodules=on-demand'
# Will abort a push if you haven't pushed a submodule -- run when you push from parent directory
alias git_sane_push='git push --recurse-submodule=check'