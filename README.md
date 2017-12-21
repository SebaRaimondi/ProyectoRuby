# Trabajo integrador TTPS-Ruby-2017

## Como preparar el ambiente

1. En la consola navegar hasta la carpeta del proyecto.

2. Asegurarse de tener instalado [Ruby](https://www.ruby-lang.org/es/).

3. Asegurarse de tener instalado [PostgreSQL](https://www.postgresql.org/).

4. Asegurarse de tener instalada la gema `bundler`. Puede instalarla ejecutando el comando `gem install bundler`.

5. Ejecutar `bundler install` para instalar todas las dependencias del proyecto.

6. Ejecutar el comando `rake db:setup` para cargar la base de datos con los datos de ejemplo.

7. Ejecutar el comando `rails s` para encender el servidor.

8. Ingresar a `localhost:3000` y loguearse con las credenciales que les envie por catedras.

## Tests

Para ejecutar los tests simplemente ejecute el comando `rails t` dentro de la carpeta de proyecto.
