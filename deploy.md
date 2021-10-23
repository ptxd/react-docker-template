# Console Command For Deployment To Docker Desktop

## Build the docker container
docker build -t react-docker-template .

## Run the docker container app

docker run -p 3000:80 react-docker-template
