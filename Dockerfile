FROM ruby:3.3.1

# Instalar dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential

# Instalar Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

WORKDIR /lemontech_events

# Copiar archivos de gemas y ejecutar bundle install
COPY Gemfile /lemontech_events/Gemfile
COPY Gemfile.lock /lemontech_events/Gemfile.lock
RUN bundle install

# Copiar package.json y ejecutar yarn install para generar yarn.lock
COPY package.json /lemontech_events/package.json
RUN yarn install

# Copiar el resto del código de la aplicación
COPY . /lemontech_events

# Precompilar assets
RUN bundle exec rake assets:precompile

# Exponer el puerto 3000
EXPOSE 3000

# Comando para iniciar el servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
