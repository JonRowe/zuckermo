# Zuckermo, a RubyMotion Wrapper for Facebook.

Hat Tip to clayallsopp/twittermotion for inspiration

## Usage

Sign in:

```ruby
Facebook.app_key = 'xxxxxxxxx'
Facebook.sign_in do |granted, ns_error|
  # have fun
end
```

See accounts:

```ruby
> Facebook.accounts
=> [#<Twitter::User>]
> Facebook.accounts[0].username
=> "name@example.com"
```

## Installation

1. `gem install zuckermo`

2. Add `require 'zuckermo'` to your `Rakefile`

## Contributing

It would be really cool if this was a fully-compatible Facebook API wrapper, so add whatever functionality you think helps!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
