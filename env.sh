# ==============================================================================
# env
# ==============================================================================
project_name='devcamp2020spring'
alias docker-compose="docker-compose -p $project_name"
alias build="docker-compose build"
alias up="docker-compose up"
alias stop="docker-compose stop"
alias spring="rm -f tmp/pids/spring.pid tmp/pids/spring.sock && up spring"
alias app="rm -f tmp/pids/server.pid && up app"
alias bundle="docker-compose run -e RAILS_ENV=development --rm app bundle"
alias rails="docker-compose run -e RAILS_ENV=development --rm app bundle exec rails"
alias rake="docker-compose run -e RAILS_ENV=development --rm app bundle exec rake"
alias seed_fu="rake db:seed_fu FIXTURE_PATH=db/seeds/development/"
alias rspec="docker-compose run -e RAILS_ENV=test --rm spring spring rspec"
alias rubocop="docker-compose run -e RAILS_ENV=development --rm app bundle exec rubocop -DESP"
alias rubocop_show_class="docker-compose run -e RAILS_ENV=development --rm app bundle exec rubocop -D"
alias guard="docker-compose run -e RAILS_ENV=test --rm app bundle exec guard"
alias rswag="docker-compose run -e RAILS_ENV=test --rm app bundle exec rails rswag:specs:swaggerize"
