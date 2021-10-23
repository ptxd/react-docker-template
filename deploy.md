# Console Command For Deployment To Docker Desktop

## Build the docker image
docker build -t react-docker-template .

## Run the docker app

docker run -p 3000:80 react-docker-template
