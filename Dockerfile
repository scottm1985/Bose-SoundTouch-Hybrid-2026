FROM node:22-alpine
WORKDIR /app

# Install timezones (tzdata)
RUN apk add --no-cache tzdata

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy all code/templates into the image
COPY . .

# ONLY create the internal config 
# server.js creates the 'logs' folder
RUN mkdir -p /app/config

CMD ["node", "server.js"]