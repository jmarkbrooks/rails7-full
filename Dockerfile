FROM ruby:3.1.0
RUN apt update -qq
RUN apt install build-essential
WORKDIR /app
COPY . .
RUN bundle install
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000
CMD ["bundle","exec","rails","server","-b","0.0.0.0","-p","3000"]