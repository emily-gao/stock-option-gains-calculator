This is a [Ruby](https://www.ruby-lang.org/en/) app that calculates the realized and unrealized gains for multiple employees given a history of stock option grants, sales and performance bonuses.

### Build App
```
bundle install
```

### Run App
```
ruby app.rb < <input-file>
```

Example `ruby app.rb < 1.txt`

### Run Tests
The calculator uses [RSpec](https://github.com/rspec/rspec) as test framework. 

- Running all tests:
```
bundle exec rspec
```
- Running tests for a specific file: 
```
bundle exec rspec spec/app.rb
```
