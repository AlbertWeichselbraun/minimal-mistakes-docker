#
# Dockerfile
# based on a tutorial by 
#   https://www.cross-validated.com/Personal-website-with-Minimal-Mistakes-Jekyll-Theme-HOWTO-Part-I/
#
# Build image:
# - docker build -t albert/semanticlab .
#
# Run image
# - docker run --volume="$PWD:/usr/src/app" -p 4000:4000 -it albert/semanticlab bundle exec rake preview

FROM ruby:2.7

WORKDIR /usr/src/app

# create a volume for mounting the local directory
VOLUME /usr/src/app

# copy bundle configuration prior to `bundle install`
COPY semanticlab.net/Gemfile semanticlab.net/minimal-mistakes-jekyll.gemspec ./

RUN bundle install
EXPOSE 4000
CMD ["jekyll", "serve"]
