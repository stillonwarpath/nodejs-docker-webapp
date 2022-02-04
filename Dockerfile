# From what image we want to build from.
# This image comes with Node.js and NPM already installed.
FROM node:16

# Create a directory to hold the application code inside the image
# this will be the working directory for the application
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# if you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# App binds to port 8080, this instruction have mapped it by the docker daemon
EXPOSE 8080

CMD [ "node","server.js" ]