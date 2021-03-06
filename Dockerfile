FROM ruby:2.5.1 as base

# set some default ENV values for the image
ENV BUNDLE_PATH /bundle
ENV RAILS_LOG_TO_STDOUT 1
ENV RAILS_SERVE_STATIC_FILES 1
ENV EXECJS_RUNTIME Node
ENV SECRET_KEY_BASE 77dbe6ad1bccaca1ff0dbe540f2a87e391be6a9668639b72f7456dde2db2810f9ac6de35e5f299a31a4c75b670fabccbcae5ce955c906e16fcc4b44bdc622391
ENV BOOK_MY_SHOW_DATABASE_PASSWORD postgres

# set the app directory var
ENV APP_HOME /home/app
WORKDIR $APP_HOME

ARG NODE_MAJOR_VERSION=14
RUN curl -sL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash - \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  default-libmysqlclient-dev \
  dumb-init \
  git \
  libssl-dev \
  libxslt-dev \
  nodejs \
  openssh-client \
  postgresql-client \
  unzip \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean



# install specific bundler version
ARG BUNDLER_VERSION=1.17.1
RUN gem install bundler -v "${BUNDLER_VERSION}"

# install gems
ARG BUNDLE_WITHOUT="development test"
COPY Gemfile* ./
RUN bundle install --without ${BUNDLE_WITHOUT}

# install node modules
COPY package.json yarn.lock ./

# copy code
COPY . .

ARG RAILS_ENV=production
ENV RAILS_ENV ${RAILS_ENV}
ENTRYPOINT ./entrypoint.sh