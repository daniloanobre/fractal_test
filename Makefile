run:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rails s -p 3000 -b '0.0.0.0'

console:
	bundle exec rails c

createdb:
	bundle exec rails db:drop
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed
	bundle exec rails db:test:prepare

yarn-install:
	npm install yarn --silent && \
	yarn install --modules-folder public/packs

tests:
	rubocop -a
	fasterer
	rubycritic