FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ADD . /facelook
WORKDIR /facelook
RUN bundle install

EXPOSE 5000

CMD ["bash"]