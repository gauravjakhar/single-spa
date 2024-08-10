# single-spa-docker-example

## To run this example using Docker Compose:
### inside the environment folder:
```
docker-compose build
docker-compose up
```
You can access the portal at [http://localhost:5001](http://localhost:5001)

## To run this example using individual Docker image:
### build all docker images:

```
# Create a custom network
docker network create single-spa-network

# Run MongoDB
docker run -d --name mongo --network single-spa-network -p 27017:27017 mongo

# Run single-spa
docker run -d --name single-spa --network single-spa-network -p 5001:80 \
  -e VUE_APP_URL=http://localhost:5000 \
  -e REACT_APP_URL=http://localhost:5002 \
  -e VUE_PARCEL_URL=http://localhost:5003 \
  -e REACT_PARCEL_URL=http://localhost:5004 \
  single-spa

# Run other frontend services
docker run -d --name sample-vue --network single-spa-network -p 5000:81 sample-vue
docker run -d --name sample-react --network single-spa-network -p 5002:82 sample-react
docker run -d --name sample-vue-parcel --network single-spa-network -p 5003:83 sample-vue-parcel
docker run -d --name sample-react-parcel --network single-spa-network -p 5004:84 sample-react-parcel

# Run APIs
docker run -d --name sample-api --network single-spa-network -p 8080:3005 \
  -e DB=mongodb://mongo:27017 -e DB_name=test -e NODE_ENV=production sample-api

docker run -d --name sample-api2 --network single-spa-network -p 8081:3006 \
  -e DB=mongodb://mongo:27017 -e DB_name=test2 -e NODE_ENV=production sample-api2
```