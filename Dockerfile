ARG DOCKER_BUILD_IMAGE_NAME=node:alpine
ARG DOCKER_RUN_IMAGE_NAME=nginx:stable-alpine

# Stage 1: Build the Angular application
FROM ${DOCKER_BUILD_IMAGE_NAME} AS builder
WORKDIR /app
COPY . .
RUN npm -v
RUN node -v
RUN npm install
RUN npx rsbuild build

# Stage 2: Serve the application with Nginx
FROM ${DOCKER_RUN_IMAGE_NAME}
COPY --from=builder /app/dist/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
