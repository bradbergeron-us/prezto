#
# Defines Ruby on Rails aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Jake Bell <jake.b.bell@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'ruby'

# Return if requirements are not found.
if (( ! $+commands[bundle] )); then
  return 1
fi

#
# Aliases
#

alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bib='bundle install --binstubs'
alias ror='bundle exec rails'
alias rorc='bundle exec rails console'
alias rordc='bundle exec rails dbconsole'
alias rordm='bundle exec rake db:migrate'
alias rordM='bundle exec rake db:migrate db:test:clone'
alias rordr='bundle exec rake db:rollback'
alias rorg='bundle exec rails generate'
alias rorl='tail -f "$(ruby-app-root)/log/development.log"'
alias rorlc='bundle exec rake log:clear'
alias rorp='bundle exec rails plugin'
alias rorr='bundle exec rails runner'
alias rors='bundle exec rails server'
alias rorsd='bundle exec rails server --debugger'
alias rorx='bundle exec rails destroy'

# ----- Pow ----- #

alias pd='powder'
alias pdl='powder link'
alias pdo='powder open'
alias pdr='powder restart'

# ----- Rails ----- #

alias ra='./bin/rails'
alias rac='./bin/rails c'
alias rag='./bin/rails g'
alias ras='./bin/rails s'

# ----- Rake ----- #

alias rake="noglob rake"
alias rk='./bin/rake'
alias rkap='RAILS_ENV=development ./bin/rake assets:precompile'
alias rkdbc='./bin/rake db:create'
alias rkdbd='./bin/rake db:drop'
alias rkdbm='./bin/rake db:migrate'
alias rkdbr='./bin/rake db:reset'
alias rkdbs='./bin/rake db:seed'
alias rkdbt='./bin/rake db:setup'
alias rkdy='rake deploy'


# ----- Rails ----- #
alias migrate="rake db:migrate db:rollback && rake db:migrate"
alias s="rspec"
