FROM node:latest

# Accept proxy build args (from Jenkins or docker CLI)
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

# Set proxy as environment variables inside the image
ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY
ENV NO_PROXY=$NO_PROXY

# Set working directory
WORKDIR /usr/src/app

# Copy dependency file and install
COPY package.json ./

# Install dependencies
RUN npm install

# Copy rest of the application code
COPY . .

# Expose app port
EXPOSE 4000

# Start the app
CMD [ "node", "index.js" ]
