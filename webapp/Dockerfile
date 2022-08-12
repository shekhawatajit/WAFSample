# pull official base image
FROM node:18.3

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY ./webapp/package.json ./
COPY ./webapp/package-lock.json ./
RUN npm install -g npm@8.16.0
RUN npm install --silent
RUN npm install react-scripts@5.0.1 --location=global --silent

# add app
COPY ./webapp/ ./

# start app
CMD ["npm", "start"]