# README

Weather forecast notification and Facebook integration for Gasherbrum2 2021 Expediation.

## Ruby version
```sh
% ruby --version
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
```

## System dependencies
```sh
bundle install
```

## Configuration
```sh
% echo EMAIL=#### > .env
% echo PASS=#### > .env
```

## Database creation
```sh
rails db:create
```

## Database initialization
```sh
rails db:migrate
rails db:seed
```

* How to run the test suite

## Services (jobs, forecast engines, etc.)
### mountain-forecast.com provider
The first/default weather forecast provider...

### forecast job
It fetches forecast data from configured forecat provider.
```sh
rails gasherbrum2:forecast
```
### notification job
Sends out all email notifications with latest forecast data.
```sh
rails gasherbrum2:notifications
```

## Deployment instructions
- Automated CI enabled on staging, commit the code to githhub and you are all set.
- Manual promotion to production using Heroku dashboard.
