# Omniauth::EveO

[![Gem Version](https://badge.fury.io/rb/omniauth-eve_o.svg)](https://badge.fury.io/rb/omniauth-eve_o)

Welcome to OmniAuth-Eve_O! This is a strategy for using OmniAuth with Eve Online. See the most updated README on the [GitHub]('http://www.github.com/lnchambers/omniauth-eve_o') page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-eve_o'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-eve_o

## Usage

Go to the [Eve Online Developer](https://developers.eveonline.com/) site and register your application

When registering your application, set the callback_url to `http://<your website domain>/auth/eve_o/callback`

### In Rails

  Touch `/config/initializers/omniauth.rb`

  Add the following code to omniauth.rb

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :eve_o, 'client_id', 'client_secret'
  end
```

  Although scope is optional in Eve_O, it is recommended to have it set based on the permissions you set when you set up your application on the [Eve Online Developer](https://developers.eveonline.com/) site.

```ruby
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :eve_o, 'client_id', 'client_secret', scope: 'publicData structureVulnUpdate'
  end
```

  In your program, when users want to log in, redirect them to `auth/eve_o`. They will be directed to the Eve Online sign on and will follow the process.

  The `auth_hash` returned should look something like this:

```ruby
  {
    "access_token":"uNEEh...a_WpiaA2",
    "token_type":"Bearer",
    "expires_in":1200,
    "refresh_token":"gEy...fM0"
  }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lnchambers/omniauth-eve_o. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::EveO project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lnchambers/omniauth-eve_o/blob/master/CODE_OF_CONDUCT.md).
