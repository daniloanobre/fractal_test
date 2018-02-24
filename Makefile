DCMP = docker-compose
APP = fractal_test
DCMP_EXEC_APP = ${DCMP} exec ${APP}
DCMP_RUN_APP = ${DCMP} run ${APP}

run:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rails s -p 3000 -b '0.0.0.0'

up:
	${DCMP} up

down:
	${DCMP} down

bash:
	${DCMP_EXEC_APP} bash

console:
	${DCMP_EXEC_APP} rails c

restart-app:
	${DCMP} restart ${APP}

build:
	make down
	${DCMP} build --no-cache

docker-createdb:
	${DCMP_RUN_APP} make createdb

createdb:
	${DCMP_RUN_APP} bundle exec rails db:drop
	${DCMP_RUN_APP} bundle exec rails db:create
	${DCMP_RUN_APP} bundle exec rails db:migrate
	${DCMP_RUN_APP} bundle exec rails db:seed
	${DCMP_RUN_APP} bundle exec rails db:test:prepare

yarn-install:
	${DCMP_RUN_APP} npm install yarn --silent && \
	yarn install --modules-folder public/packs

tests:
	${DCMP_EXEC_APP} rubocop -a
	${DCMP_EXEC_APP} fasterer

rspec-tests:
	${DCMP_EXEC_APP} rspec

sidekiq:
	bundle install
	bundle exec sidekiq -C config/sidekiq.yml