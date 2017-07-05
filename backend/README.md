### Backend (Rails API) setup ###
> *Before follow those steps need to setup [Ruby on Rials](https://gorails.com/setup/ubuntu/16.04) framework to your local pc*

* Setup [PostgreSql](https://help.ubuntu.com/lts/serverguide/postgresql.html#postgresql-installation) database on your local pc
* Copy `local_env.example.yml` file in [Blog API](#) Application backend config directory
    - `backend/config/local_env.example.yml` to `backend/config/local_env.yml`
* Update PostgreSQL DB `username` and `Password` in your local configuration file `backend/config/local_env.yml`
* `bundle install`
* `bundle exec rails db:setup`
* `bundle exec rails db:seed`
* `rails server`