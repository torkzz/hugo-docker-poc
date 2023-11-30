# Use a lightweight Alpine image
FROM alpine:latest

# Set working directory inside the container
WORKDIR /site

# Install Hugo
RUN apk add --no-cache hugo

# Check if a Hugo site exists, if not, create a new one
RUN ls -A | grep -q "config.toml" || hugo new site .

# Expose default Hugo server port
EXPOSE 1313

# Copy the site contents into the container
COPY . .

# Default command to start Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0"]
