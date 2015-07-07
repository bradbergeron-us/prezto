Git
===

Enhances the [Git][1] distributed version control system by providing aliases,
functions and by exposing repository status information to prompts.

Git **1.7.2** is the [minimum required version][7].

Settings
--------

### Log

The format of the [git-log][8] output is configurable via the following style,
where context is *brief*, *oneline*, and *medium*, which will be passed to the
`--pretty=format:` switch.

    zstyle ':prezto:module:git:log:context' format ''

### Status

Retrieving the status of a repository with submodules can take a long time.
Submodules may be ignored when they are *dirty*, *untracked*, *all*, or *none*.

    zstyle ':prezto:module:git:status:ignore' submodules 'all'

This setting affects all aliases and functions that call `git-status`.

Aliases
-------

## Settings

### Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

### Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

## Aliases

 - g'git'

### Add (a)
- 'ga' git add
- 'gac' git add . && git commit
- 'gacv' git add . && git commit --verbose
- 'gap' git add -p
- 'gast' git add . && git stash save

### Branch (b)
- 'gb' git branch
- 'gba' git branch -a
- 'gbL' git branch -av
- 'gbc' git checkout -b
- 'gbx' git branch -d
- 'gbd' git branch -D
- 'gbX' git branch -D
- 'gbdr' git push origin --delete
- 'gbm' git branch -m
- 'gbM' git branch -M
- 'gbr' git branch -r
- 'gbs' git show-branch
- 'gbS' git show-branch -a

### Commit (c)
### - 'gc'git commit'
- 'gc' git commit --verbose
- 'gca' git commit --verbose --all
- 'gcam' git commit -a -m
- 'gce' git commit --amend
- 'gcf' git commit --amend --reuse-message HEAD
- 'gcF' git commit --verbose --amend
- 'gcl' git-commit-lost
- 'gcm' git commit --message
- 'gcp' git cherry-pick --ff
- 'gcP' git cherry-pick --no-commit
- 'gcr' git revert
- 'gcR' git reset "HEAD^"
- 'gcs' git show
- 'gcv' git commit --verbose

### Checkout (co)
- 'gco'git checkout
- 'gcob'git checkout -b
- 'gcom'git checkout master
- 'gcO'git checkout --patch

### Conflict (C)
- 'gCl' git status | sed -n "s/^.*both [a-z]*ed: *//p"
- 'gCa' git add $(gCl)
- 'gCe' git mergetool $(gCl)
- 'gCo' git checkout --ours --
- 'gCO' gCo $(gCl)
- 'gCt' git checkout --theirs --
- 'gCT' gCt $(gCl)

### Diff (d)
- 'gd' git diff
- 'gdc' git diff --stat --color
- 'gdcn' git diff --name-status
- 'gdcs' git shortlog
- 'gds' git diff --staged
- 'gdst' git diff --stat
- 'gdt' git difftool
- 'gfb' git checkout -b

### Data Listing (D)
- 'gD' git ls-files
- 'gDc' git ls-files --cached
- 'gDx' git ls-files --deleted
- 'gDm' git ls-files --modified
- 'gDu' git ls-files --other --exclude-standard
- 'gDk' git ls-files --killed
- 'gDi' git status --porcelain --short --ignored | sed -n "s/^!! //p"

### Fetch (f)
- 'gf' git fetch
- 'gfc' git clone
- 'gfm' git pull
- 'gfr' git pull --rebase

### Grep (g)
- 'gg' git grep
- 'ggi' git grep --ignore-case
- 'ggl' git grep --files-with-matches
- 'ggL' git grep --files-without-matches
- 'ggv' git grep --invert-match
- 'ggw' git grep --word-regexp

### Graph (g)
- 'ggl' git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative -15
- 'gga' git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative
- 'ggo' git log --oneline --stat
- 'ggy' git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --since yesterday

### Hub (h)
- 'h' hub
- 'hb' hub browse
- 'hc' hub clone
- 'hp' hub pull-request

### Index (i)
- 'gia' git add
- 'giA' git add --patch
- 'giu' git add --update
- 'gid' git diff --no-ext-diff --cached
- 'giD' git diff --no-ext-diff --cached --word-diff
- 'gir' git reset
- 'giR' git reset --patch
- 'gix' git rm -r --cached
- 'giX' git rm -rf --cached

### Log (l)
- 'gl' git log --topo-order --pretty=format:"${_git_log_medium_format}"
- 'gls' git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"
- 'gld' git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"
- 'glo' git log --topo-order --pretty=format:"${_git_log_oneline_format}"
- 'glg' git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"
- 'glb' git log --topo-order --pretty=format:"${_git_log_brief_format}"
- 'glc' git shortlog --summary --numbered

### Pull (l)
- 'gl' git pull'
- 'glr' git pull --rebase

### Merge (m)
- 'gm' git merge
- 'gma' git merge --abort
- 'gmt' git mergetool
- 'gmC' git merge --no-commit
- 'gmF' git merge --no-ff
- 'gmff' git merge --no-ff
- 'gmm' git merge master

### Pull (pp)
- 'gpp' git pull --rebase && git push
- 'gppt' git pull --rebase && git push && git push --tags
- 'gpp' git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"

### Push (p)
- 'gp' git push
- 'gpc' git push --set-upstream origin "$(git-branch-current 2> /dev/null)"
- 'gpf' git push --force
- 'gpa' git push --all
- 'gpA' git push --all && git push --tags
- 'gpo' git push origin
- 'gpom' git push origin master
- 'gpt' git push --tags
- 'gptb' git push -u origin

### Rebase (r)
- 'gr' git rebase
- 'gra' git rebase --abort
- 'grc' git rebase --continue
- 'gri' git rebase --interactive
- 'grs' git rebase --skip

### Remote (r)
- 'grpd' git remote prune origin --dry-run
- 'grp' git remote prune origin

### Remote (R)
- 'gR' git remote
- 'gRl' git remote --verbose
- 'gRa' git remote add
- 'gRx' git remote rm
- 'gRm' git remote rename
- 'gRu' git remote update
- 'gRp' git remote prune
- 'gRs' git remote show
- 'gRb' git-hub-browse

### Reset (r)
- 'grd' git reset --hard
- 'grh' git reset HEAD^

### Status (s)
- 'gs' git status
- 'gss' git status -sb

### Stash (st)
- 'gst' git stash
- 'gsta' git stash apply
- 'gsts' git stash save
- 'gsts' git stash save --include-untracked
- 'gstS' git stash save --patch --no-keep-index
- 'gstw' git stash save --include-untracked --keep-index
- 'gstd' git stash drop stash@{0}
- 'gsth' git stash show
- 'gstd' git stash show --patch --stat
- 'gstl' git stash list
- 'gstp' git stash pop
- 'gstx' git stash drop
- 'gstL' git-stash-dropped
- 'gstr' git-stash-recover
- 'gstX' git-stash-clear-interactive

### Submodule (S)
- 'gS' git submodule
- 'gSa' git submodule add
- 'gSf' git submodule foreach
- 'gSi' git submodule init
- 'gSI' git submodule update --init --recursive
- 'gSl' git submodule status
- 'gSm' git-submodule-move
- 'gSs' git submodule sync
- 'gSu' git submodule foreach git pull origin master
- 'gSx' git-submodule-remove

### Working Copy (w)
- 'gws' git status --ignore-submodules=${_git_status_ignore_submodules} --short
- 'gwS' git status --ignore-submodules=${_git_status_ignore_submodules}
- 'gwd' git diff --no-ext-diff
- 'gwD' git diff --no-ext-diff --word-diff
- 'gwr' git reset --soft
- 'gwR' git reset --hard
- 'gwc' git clean -n
- 'gwC' git clean -f
- 'gwx' git rm -r
- 'gwX' git rm -rf

### Tag (t)
- 'gt' git tag
- 'gtd' git tag -d

### Upda/te Index (ui)
- 'gui' git update-index --assume-unchanged

### Show (w)
- 'gw' git show

### Underscore Functions
- 'git_author_commits='git shortlog --summary --numbered'
- 'git_config_vars='git config --global -l'
- 'git_current_tag='git describe --abbrev=0 --tags'
- 'git_push_deploy='git pull --rebase && git push && rake deploy'
- 'git_standup="git log --since yesterday --author='$USERNAME' --pretty=oneline"
- 'git_today="git log --since=midnight --author='$NAME' --oneline"
- 'git_update_submodules='git submodule foreach git pull'
# Push all repositories (even submodules)
- 'git_push_all='git push --recurse-submodules=on-demand'
# Will abort a push if you haven't pushed a submodule -- run when you push from parent directory
- 'git_sane_push='git push --recurse-submodule=check'

### Shadows

The following aliases may shadow system commands:

  - `gpt` shadows the [GUID partition table maintenance utility][4].
  - `gs` shadows the [Ghostscript][5].

If you frequently use the above commands, you may wish to remove said aliases
from this module or to disable them at the bottom of the zshrc with `unalias`.

You can temporarily bypass an alias by prefixing it with a backward slash:
`\gpt`.

Functions
---------

  - `git-branch-current` displays the current branch.
  - `git-commit-lost` lists lost commits.
  - `git-dir` displays the path to the Git directory.
  - `git-hub-browse` opens the [GitHub][3] repository in the default browser.
  - `git-hub-shorten-url` shortens GitHub URLs.
  - `git-info` exposes repository information via the `$git_info` associative
    array.
  - `git-root` displays the path to the working tree root.
  - `git-stash-clear-interactive` asks for confirmation before clearing the stash.
  - `git-stash-dropped` lists dropped stashed states.
  - `git-stash-recover` recovers given dropped stashed states.
  - `git-submodule-move` moves a submodule.
  - `git-submodule-remove` removes a submodule.

Theming
-------

To display information about the current repository in a prompt, define the
following styles in the `prompt_name_setup` function, where the syntax for
setting a style is as follows.

    zstyle ':prezto:module:git:info:context:subcontext' format 'string'

### Main Contexts

| Name      | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| action    |     %s      | Special action name
| ahead     |     %A      | Commits ahead of remote count
| behind    |     %B      | Commits behind of remote count
| branch    |     %b      | Branch name
| commit    |     %c      | Commit hash
| position  |     %p      | Commits from the nearest tag count
| remote    |     %R      | Remote name
| stashed   |     %S      | Stashed states count

### Concise Contexts

| Name      | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| clean     |     %C      | Clean state
| dirty     |     %D      | Dirty files count
| indexed   |     %i      | Indexed files count
| unindexed |     %I      | Unindexed files count
| untracked |     %u      | Untracked files count

The following contexts must be enabled with the following zstyle:

    zstyle ':prezto:module:git:info' verbose 'yes'

### Verbose Contexts

| Name      | Format Code | Description
| --------- | :---------: | ---------------------------------------------------
| added     |     %a      | Added files count
| clean     |     %C      | Clean state
| deleted   |     %d      | Deleted files count
| dirty     |     %D      | Dirty files count
| modified  |     %m      | Modified files count
| renamed   |     %r      | Renamed files count
| unmerged  |     %U      | Unmerged files count
| untracked |     %u      | Untracked files count

### Special Action Contexts

| Name                 |   Format    | Description
| -------------------- | :---------: | -----------------------------------------
| apply                |    value    | Applying patches
| bisect               |    value    | Binary searching for changes
| cherry-pick          |    value    | Cherry picking
| cherry-pick-sequence |    value    | Cherry picking sequence
| merge                |    value    | Merging
| rebase               |    value    | Rebasing
| rebase-interactive   |    value    | Rebasing interactively
| rebase-merge         |    value    | Rebasing merge

First, format the repository state attributes. For example, to format the branch
and remote names, define the following styles.

    zstyle ':prezto:module:git:info:branch' format 'branch:%b'
    zstyle ':prezto:module:git:info:remote' format 'remote:%R'

Second, format how the above attributes are displayed in prompts.

    zstyle ':prezto:module:git:info:keys' format \
      'prompt'  ' git(%b)' \
      'rprompt' '[%R]'

Last, add `$git_info[prompt]` to `$PROMPT` and `$git_info[rprompt]` to
`$RPROMPT` respectively and call `git-info` in the `prompt_name_preexec` hook
function.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][6].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Colin Hebert](https://github.com/ColinHebert)

[1]: http://www.git-scm.com
[2]: https://github.com/defunkt/hub
[3]: https://www.github.com
[4]: http://www.manpagez.com/man/8/gpt/
[5]: http://linux.die.net/man/1/gs
[6]: https://github.com/sorin-ionescu/prezto/issues
[7]: https://github.com/sorin-ionescu/prezto/issues/219
[8]: http://www.kernel.org/pub/software/scm/git/docs/git-log.html
