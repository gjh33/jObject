# JObject

jObject is a gem designed to parse json strings with json objects and convert them into usable ruby objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jObject'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jObject

## Usage

Usage is as simple as running

```ruby
json_string = '{ "attribute": "value" }'

my_object = JObject.parse(json_string)

my_object.attribute #=> "value"
```

If you want to parse a json string that is a list of objects,
simply use

```ruby
json_string = '[{ "name": "object1" }, { "name": "object2" }]'

my_objects = JObject.parse_each(json_string)

my_objects[0].name #=> "object1"
my_objects[1].name #=> "object2"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gjh33/jObject.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

