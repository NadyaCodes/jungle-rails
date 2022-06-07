# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## About

Jungle is an e-commece site that uses Ruby on Rails and Stripe. This was an assignemnt at lighthouse labs where we inherited some code, and then changed and implemented some new features and bug fixes. While I'd love to take credit for the whole thing, this is more of a display of the medium I can work within, as opposed to a project I started from scratch.

## Images
!["About Us Page"](https://github.com/NadyaCodes/jungle-rails/blob/0d462c19971dcc229a615f13dc8d58e5756948d3/docs/jungle-about-us.png?raw=true)

!["Admin Categories"](https://github.com/NadyaCodes/jungle-rails/blob/0d462c19971dcc229a615f13dc8d58e5756948d3/docs/jungle-admin-categories.png?raw=true)

!["Homepage"](https://github.com/NadyaCodes/jungle-rails/blob/0d462c19971dcc229a615f13dc8d58e5756948d3/docs/jungle-home.png?raw=true)

!["My Cart"](https://github.com/NadyaCodes/jungle-rails/blob/0d462c19971dcc229a615f13dc8d58e5756948d3/docs/jungle-my-cart.png?raw=true)

!["Products Page"](https://github.com/NadyaCodes/jungle-rails/blob/0d462c19971dcc229a615f13dc8d58e5756948d3/docs/jungle-products.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
