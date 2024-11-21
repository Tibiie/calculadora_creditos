# Etapa 1: Build (Flutter)
FROM dart:stable AS build

WORKDIR /usr/src/app

# Instalar Flutter SDK
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    && curl -LO https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz.intoto.jsonl \
    && tar xf flutter_linux_3.24.3-stable.tar.xz \
    && rm flutter_linux_3.24.3-stable.tar.xz

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

# Copiar configuración personalizada de Nginx (si tienes)
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8005

# Ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
