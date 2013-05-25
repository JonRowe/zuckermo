# Zuckermo
## A RubyMotion wrapper for Facebook.

Hat Tip to clayallsopp/twittermotion for inspiration

## Usage

### Setup

```ruby
Facebook.app_id = 'xxxxxxxxx'
```

Note you must configure your `app_id` to one registered with facebook, you must also
set this app to allow iOS sign in and set your bundle id (e.g. com.company.appname).

### Sign in

```ruby
Facebook.sign_in permissions, audience do |granted, ns_error|
  # have fun
end
```

You must supply permissions, we ask for `['email']` by default, which is the most basic
level of permissions we can ask for (facebook refers to this as basic info). Audience is
required for certain permissions (see the Facebook framework for details of these).

### Accounts

```ruby
> Facebook.accounts
=> [#<Facebook::User>]
> Facebook.accounts[0].username
=> "name@example.com"
```

### iOS 5

You can include this gem when targeting iOS5, but when actuallt running on iOS 5 the
facebook functionality will return `[]` for accounts, and `sign_in` will return an error.
You can check if we support the current os with `Facebook.supported?` at any time.

This is because  of the lack of the Facebook framework, I'd happily accept a PR to use
a polyfill ;)

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
