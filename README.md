# Omniauth::Thecity

[![Gem Version](https://badge.fury.io/rb/omniauth-thecity.png)](http://badge.fury.io/rb/omniauth-thecity)
[![Dependency Status](https://gemnasium.com/thecity/omniauth-thecity.png)](https://gemnasium.com/thecity/omniauth-thecity)

This gem contains The City strategy for OmniAuth.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-thecity'
```

Or install it yourself as:
```
$ gem install omniauth-thecity
```
## Usage

Tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :thecity, "APPID", "SECRET", :scope => 'user_basic user_extended'
end
```

## Authentication Hash
An example auth hash available in `request.env['omniauth.auth']`:

```ruby
{
  "provider"=>:thecity,
  "uid"=>216612,
	"info"=> {
    "global_user"=> {
      "id"=>216612,
      "first"=>"Robert",
      "last"=>"Robertson",
      "email"=>"robert.son@email.com",
      "gender"=>"Male",
      "birthdate"=>"1977-10-13"
    },
    "user"=> {
      "id"=>14347,
      "title"=>"Deacon",
      "member"=>false,
      "staff"=>true,
      "first"=>"Bob",
      "last"=>"Robertson",
      "email"=>"robert.son@email.com",
      "account_id"=>12345678,
      "profile_picture"=> "https://....a4bfe58666_thumb.png",
      "admin_privileges"=>[
        { "title"=>"Account Admin" },
        { "group_id"=>12345, "title"=>"Group Admin" },
        { "title"=>"User Admin" }
      ]
    }
  },
  "credentials"=> {
    "token"=>"3551fe753551355144dc88b45173551f9e69dde79f355180db35516c11b357e9",
    "expires"=>false
  },
  "extra"=>{}
}
```

## Watch the RailsCast

Ryan Bates has put together an excellent RailsCast on OmniAuth:

[![RailsCast #241](http://railscasts.com/static/episodes/stills/241-simple-omniauth-revised.png "RailsCast #241 - Simple OmniAuth (revised)")](http://railscasts.com/episodes/241-simple-omniauth-revised)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Copyright (c) 2013 Mark Blair
See [LICENSE][] for details.

[license]: LICENSE.txt
