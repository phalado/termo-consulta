APP := website
RUN := docker-compose run --rm web
spec := spec

setup:
	docker-compose build
	make bundle
	make reset

bundle:
	$(RUN) bundle install

up:
	docker-compose up

build:
	docker-compose up --build

down:
	docker-compose down

serve_debug:
	docker-compose up -d
	docker attach $(APP)

bash:
	$(RUN) bash

console:
	$(RUN) bundle exec rails c

rspec:
	$(RUN) bundle exec rspec $(spec)

routes:
	$(RUN) bundle exec rails routes

rubocop:
	$(RUN) bundle exec rubocop

guard:
	$(RUN) bundle exec guard

sidekiq:
	$(RUN) bundle exec sidekiq

create:
	$(RUN) bundle exec rake db:create

migrate:
	$(RUN) bundle exec rake db:migrate

seed:
	$(RUN) bundle exec rake db:seed

drop:
	$(RUN) bundle exec rake db:drop

reset:
	$(RUN) bundle exec rake db:drop db:create db:migrate 

run:
	$(RUN) bundle exec $(c)

push:
	git add .
	git commit -m "$(c)"
	git push
