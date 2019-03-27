# HDAP grails project template
---

## Running locally

#### Development and Debugging
I recommend you use an IDE for development and debugging. 

#### Running locally using docker 

1. Install *docker* and *docker-compose*
2. In your terminal, type: `docker-compose up --build`

## Deploying to HDAP

Make sure the application is running locally.

If Jenkins is already configured to listen for activity on any branch, it will build and deploy your app 
automatically whenever there is an update.

## Accessing the application in HDAP:

Your TA will provide a url through which you can access your app. 
You may need to change the server port attribute in application.yml to 80 instead of 8080
