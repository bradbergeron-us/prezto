#
# Configures Ruby local gem installation, loads version managers, and defines
# aliases.

# Load manually installed rbenv into the shell session.
elif [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  eval "$(rbenv init - --no-rehash zsh)"

# Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
  eval "$(rbenv init - --no-rehash zsh)"


# Prepend local gems bin directories to PATH.
else
  path=($HOME/.gem/ruby/*/bin(N) $path)
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! $+commands[rbenv] ) )); then
  return 1
fi

#
# Aliases
#

# General
alias rb='rbenv'
alias rbi='rbenv install'
alias rbil='rbenv install list'
alias rbr='rbenv rehash'
alias rbv='rbenv version'
alias rbva='rbenv versions'
alias update_rbenv='cd $HOME/.rbenv && git pull && cd -'
alias update_ruby_build='cd $HOME/.rbenv/plugins/ruby-build && git pull && cd -'

# Bundler

if (( $+commands[bundle] )); then
  alias rbb='bundle'
  alias be='bundle exec'
  alias bi='bundle install'
  alias bib='bundle install --binstubs'
  alias rbbe='bundle exec'
  alias rbbi='bundle install --path vendor/bundle'
  alias rbbl='bundle list'
  alias rbbo='bundle open'
  alias rbbp='bundle package'
  alias rbbu='bundle update'
  alias rbbI='rbbi \
    && bundle package \
    && print .bundle       >>! .gitignore \
    && print vendor/assets >>! .gitignore \
    && print vendor/bundle >>! .gitignore \
    && print vendor/cache  >>! .gitignore'
fi
