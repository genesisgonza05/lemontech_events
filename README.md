# README

# Lemontech Events
[![Maintainability](https://api.codeclimate.com/v1/badges/7453c6a8f222864d2d23/maintainability)](https://codeclimate.com/github/genesisgonza05/lemontech_events/maintainability)
[![Coverage Status](badge.svg)](https://github.com/genesisgonza05/lemontech_events)
![Docker](https://img.shields.io/badge/docker-ready-blue.svg)
![Ruby on Rails](https://img.shields.io/badge/Rails-7.1.3.3-orange.svg)
![Ruby](https://img.shields.io/badge/Ruby-3.3.1-red)

Lemontech Events es una aplicación de gestión de eventos construida con Ruby on Rails y Docker, utilizando PostgreSQL como base de datos. Esta aplicación permite a los usuarios registrarse y autenticarse para gestionar sus eventos.

## Requisitos Previos

> IMPORTANTE!: Asegúrate de tener instalados los siguientes programas en tu máquina para iniciar la configuración del proyecto:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Para levantar la aplicación por primera vez

Sigue estos pasos para configurar y levantar la aplicación por primera vez:

### 1. Clonar el Repositorio

```sh
git clone https://github.com/PENDIENTE/lemontech_events.git
cd lemontech_events
```

### 2. Construir y Levantar los Contenedores de Docker
```sh
docker-compose up -d
```

### 3. Crear y Migrar la Base de Datos
```sh
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```

### 4. Incorporar las variables de entorno

Debes incorporar este listado de variables de entorno en el archivo .env en la raiz del proyecto.

```sh
RECAPTCHA_SITE_KEY=_request_var_to_any_code_owner_
RECAPTCHA_SECRET_KEY=_request_var_to_any_code_owner_
```

> Si aún no esta creado el file .env en la raíz del proyecto, crealo con este comando:
```sh
touch .env
```
> Luego copia y pega el listado de variables en este file y guarda.


### 5. Levantar la aplicación

Una vez realizados los 4 pasos anteriores, puedes levantar la aplicación con:

```sh
docker-compose up
```

> Ya puedes ver el proyecto en tu local accediendo a la url que se genero desde la consola: http://localhost:3000/


## Levantar la aplicación frecuentemente

Una vez que has hecho la configuración inicial, puedes levantar la aplicación frecuentemente con:

```sh
docker-compose up
```

Para detener los contenedores:
```sh
docker-compose down
```

## Ejecutar Pruebas

Para ejecutar las pruebas de Rspec (Unitarias):
```sh
docker-compose run test rspec
```

Para ejecutar las pruebas de Cucumber (de Integración):
```sh
docker-compose run test cucumber
```

## Estructura del Proyecto

```sh
lemontech_events/
	├── app/
	├── bin/
	├── config/
	├── coverage/
	├── db/
	├── features/
	├── lib/
	├── log/
	├── public/
	├── spec/
	├── storage/
	├── tmp/
	├── vendor/
	├── .dockerignore
	├── .gitattributes
	├── .gitignore
	├── .rspec
	├── .ruby-version
	├── Dockerfile
	├── Gemfile
	├── Gemfile.lock
	├── README.md
	├── Rakefile
	├── badge.svg
	├── config.ru
	├── docker-compose.yml
	├── package.json

```

## Mailing

El proyecto cuenta con revision de emails con letter_opener_web en el ambiente de desarrollo, si deseas ver los emails enviados en tu entorno de desarrollo tan solo entra al siguiente enlace:
[http://localhost:3000/letter_opener](http://localhost:3000/letter_opener)

![Gestor de emails de la aplicación](public/emails-manager.png)
