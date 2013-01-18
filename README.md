# Omniauth::Thecity

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-thecity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-thecity

## Usage

Place this in omniauth.rb initializer for the project

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :thecity, "APPID", "SECRET", :scope => 'user_basic user_extended'
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request





