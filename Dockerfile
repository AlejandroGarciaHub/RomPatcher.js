# Step 1: Web server environment setup
FROM docker.io/library/nginx:alpine

# Overwrite Nginx's default fallback configuration block directly
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Wipe clean the static content path
RUN rm -rf /usr/share/nginx/html/*

# Copy the repository files directly into the Nginx web directory
# (Since the Dockerfile sits in the repo root, '.' copies everything)
COPY . /usr/share/nginx/html/

# Expose standard unencrypted web traffic port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

