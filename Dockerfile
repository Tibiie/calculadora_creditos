# Etapa 1: Build (Flutter)
FROM dart:stable AS build

WORKDIR /usr/src/app

# Instalar Flutter SDK
RUN git clone https://github.com/flutter/flutter.git

# Establecer las rutas de Flutter
ENV PATH="/usr/src/app/flutter/bin:/usr/src/app/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Copiar el código fuente
COPY . .

# Obtener dependencias de Flutter
RUN flutter pub get

# Compilar la aplicación para la web
RUN flutter build web --release

# Etapa 2: Servir con Nginx
FROM nginx:alpine

# Copiar los archivos generados por Flutter a la carpeta de Nginx
COPY --from=build /usr/src/app/build/web /usr/share/nginx/html
COPY --from=build /usr/src/app/nginx.conf /etc/nginx/conf.d/default.conf

# Copiar configuración personalizada de Nginx (si tienes)
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8005

# Ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
