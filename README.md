# README

Weather forecast notification and Facebook integration for Gasherbrum2 2021 Expediation.



## Dependencies
    For Arch Linux or use your favorite package manager...
### Ruby
```sh
% pacman -S ruby
```
```sh
% ruby --version
ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
```

### Heroku
```sh
% rua install heroku-cli-bin
```

### App dependencies
```sh
% bundle install
```
```sh
% rails --version
Rails 6.1.3.2
```

## Configuration
```sh
% echo EMAIL=#### > .env
% echo PASS=#### > .env
```

## Database initialization
```sh
% rails db:create
% rails db:migrate
% rails db:seed
```

##  Run app
```sh
% foreman start
```

##  Open app
```sh
% open http://127.0.0.1:5000
```

## Services (jobs, forecast engines, etc.)
### mountain-forecast.com provider
The first/default weather forecast provider...

### forecast job
It fetches forecast data from configured forecast provider.
```sh
% rails gasherbrum2:forecast
```
### notification job
Sends out all email notifications with latest forecast data.
```sh
% rails gasherbrum2:notifications
```

##  Run tests
```sh
% rails test
```

## Deployment instructions
- Automated CI enabled on staging, commit the code to githhub and you are all set.
- Manual promotion to production using Heroku dashboard.

## Production environment
### get forecast data
```sh
% heroku run rails gasherbrum2:forecast -a gasherbrum2-production
```

### send out notifications
```sh
% heroku run rails gasherbrum2:notifications -a gasherbrum2-production
```
