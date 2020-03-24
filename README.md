This is a [Ruby](https://www.ruby-lang.org/en/) app that calculates the realized and unrealized gains for multiple employees given a history of stock option grants, sales and performance bonuses.

### Build App
```
bundle install
```

### Run App
Replace `input.def` with your own file. 
```
ruby app.rb < input.def
```

For quick testing, you can use one of the three sample input files.
```
ruby app.rb < sample_input_files/input_3.def
```


### Run Tests
The calculator uses [RSpec](https://github.com/rspec/rspec) as test framework. 

- Running all tests:
```
bundle exec rspec
```
- Running tests for a specific file: 
```
bundle exec rspec spec/solution_spec.rb
```
