# README

Make sure you have ruby 3.1.2 installed and run in your terminal

```shell
bin/rails db:create && rails db:migrate && rails db:seed
bin/rails server
```

The API endpoints are designed to give you a result for a specific time scope (which could be a day for example). This time scope is determined by two query parameters `min_time` and `max_time`. 
All prices generated have their time on 4th December. You can query prices or best earning for each endpoint by writing in your terminal the following

```shell
curl -X GET http://127.0.0.1:3000/api/v1/prices?min_time=1670022000&max_time=1670108400
curl -X GET http://127.0.0.1:3000/api/v1/best_earnings?min_time=1670022000&max_time=1670108400
```

