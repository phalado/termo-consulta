FROM ruby:3.0.2

RUN apt-get update && apt-get install -y vim

WORKDIR /termo-consulta/

COPY . /termo-consulta/

RUN gem install bundler -v 2.2.15 --no-document

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
