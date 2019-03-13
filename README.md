# Happy Shop Server

This is the backend for our Happy Shop application.


# Features!

  - Sorting by price
  - Filters by categories and price range
  - API Docs on /api-docs

# Note
The "Add to Cart" button is there for aesthetics only. Coming soon.
Used sqlite3 so it's easier to get it up and running.

### Tech

Happy Shop uses a number of open source projects to work properly:

* Rails 5.2
* Ruby 2.5
* pagy
* jbuilder
* rswag
* rspec
* pry-rails
* factory_bot
* money-rails
* sqlite3

### Installation
Install the dependencies. Run the migration and seed. And run the server as `rails -p 8000`. Note: that the frontend is expecting port `8000`

```sh
$ bundle
$ rails db:migrate && rails db:seed
$ rails -p 8000
```

### API Docs

The api docs is powered by Swagger-UI and can be accessed on `localhost:8000/api-docs`

