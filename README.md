# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

Install Ruby Gem dependencies

`bundle install`

* Configuration

* Database creation

Create data tables

`rake db:migrate`

Seed initial user from the command line

`rails runner 'Account.create(email: "<YOURTUACCESSID>@temple.edu", password: Devise.friendly_token[0,20]).save'`

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
