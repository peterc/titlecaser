# Titlecaser



## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add titlecaser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install titlecaser

## Usage

Convenience method:

```ruby
Titlecaser.titlecase("this is a test") # => "This is a Test"
```

Or in a more longwinded way:

```ruby
Titlecaser::TitleCase.new("this is a test").convert
```

Currently, we don't monkeypatch `String` but that could be an option later.

## Tests

Note that there are tests in `/test` and a `titles.txt` file that's used to test a variety of title scenarios. These tests can be extended.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterc/titlecaser. However, please note this library has been developed to fit our particular style guide, so changes to specific title-casing choices may be rejected or questioned. We could extend the library to support multiple approaches in future, by way of non-default options, however.
