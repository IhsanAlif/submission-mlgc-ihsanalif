FROM node:18.20.2

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy Google application credentials
COPY ihsanalif-credentials.json .

# Set environment variables
ENV MODEL_URL='https://storage.googleapis.com/modelml-submission-mlgc-ihsanalif/model.json'
ENV GOOGLE_APPLICATION_CREDENTIALS=ihsanalif-credentials.json

# Copy the rest of the application code
COPY . .

# Start the application
CMD [ "npm", "run", "start" ]
