FROM ruby:2.6-alpine

RUN gem install octokit

COPY entrypoint.rb /

ENTRYPOINT ["/entrypoint.rb"]
