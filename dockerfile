# Environemnt to install flutter and build web
FROM debian:latest AS build-env

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl git unzip

# Define variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.16.5
ARG APP=/app/

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_SDK

# Change dir to the Flutter folder and checkout the specific version
RUN cd $FLUTTER_SDK && git checkout $FLUTTER_VERSION

# Setup the Flutter path as an environmental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Run Flutter doctor to ensure all dependencies are installed
RUN flutter doctor -v

# Create a folder to copy source code
RUN mkdir $APP

# Copy source code to the folder
COPY . $APP

# Set up the new folder as the working directory
WORKDIR $APP

# Run Flutter commands: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean
RUN flutter pub get
RUN flutter build web

# Use nginx to deploy
FROM nginx:1.25.2-alpine

# Copy the built web app to nginx
COPY --from=build-env $APP/build/web /usr/share/nginx/html

# Expose and run nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
