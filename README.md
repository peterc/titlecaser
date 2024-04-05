# Titlecaser

Turn (English) text strings into Title Case using a variety of common rules.

For example: *"An IRC client in your motherboard"* would become *"An IRC Client in Your Motherboard"*

The rules are more extensive than that, but broadly follow common practice, with first words being capitalized, already capitalized words maintained, minor words lowercased, etc. This is used as the house style of titles in https://rubyweekly.com/ for example.

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

## Installation

    $ bundle add titlecaser

or

    $ gem install titlecaser

## Tests

Note that there are tests in `/test` and a `titles.txt` file that's used to test a variety of title scenarios. These tests can be extended.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterc/titlecaser. However, please note this library has been developed to fit our particular style guide, so changes to specific title-casing choices may be rejected or questioned. We could extend the library to support multiple approaches in future, by way of non-default options, however.
