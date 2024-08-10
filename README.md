# single-spa-parcel-example

This project is an example of web app built with multiple microfrontends running in different VM's using the [single-spa](https://github.com/CanopyTax/single-spa) framework.

## To run this example in development mode use: 
1. Have a Mongo DB running in port **27017**
2. Inside each folder (sample-api, sample-api2, sample-vue, sample-react, sample-single-spa) run:
```
npm install
npm run serve
```
3. You can access the portal at [http://localhost:5000/index.local](http://localhost:5000/index.local)

## To run this example in production use:
### inside the environment folder:
```
docker-compose build
docker-compose up
```
You can access the portal at [http://localhost:5001](http://localhost:5001)

------------------------ ony by one -----------------------------
docker run -d -p 5001:80 single-spa
docker run -d -p 5000:81 sample-vue
docker run -d -p 5002:82 sample-react
docker run -d -p 5003:83 sample-vue-parcel
docker run -d -p 5004:84 sample-react-parcel
docker run -d -p 8080:3005 -e DB=mongodb://mongo:27017 -e DB_name=test -e NODE_ENV=production sample-api
docker run -d -p 8081:3006 -e DB=mongodb://mongo:27017 -e DB_name=test2 -e NODE_ENV=production sample-api2
docker run -d -p 27017:27017 mongo