FROM node:18.20.2

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy .env file separately to avoid conflict
COPY .env .env

# Copy the rest of the application code
COPY . .

# Start the application
CMD [ "npm", "run", "start" ]