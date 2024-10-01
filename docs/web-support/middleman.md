### Middleman

Make sure you have `middleman-sprockets` in your `Gemfile`
```ruby
gem 'middleman-sprockets'
gem 'apexcharts'
```
Don't forget to `bundle install`.

Activate them in `config.rb`
```ruby
activate :sprockets
activate :apexcharts
```

and then require it in your `source/javascripts/site.js`.
```js
//= require apexcharts
```
