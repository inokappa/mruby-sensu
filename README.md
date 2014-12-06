# Sensu API client for mruby

require mruby-httprequest mruby-json

## install by mrbgems

dd conf.gem line to `build_config.rb`

```build_config.rb
MRuby::Build.new do |conf|

  conf.gem :git => 'https://github.com/inokappa/mruby-sensu.git'

end
```

## example

```ruby
config = {
  :host  => "http://127.0.0.1",
  :port => "4567",
  :ua   => "mruby-sensu",
  :user => "",
  :pass => "",
}

s = Sensu::Client.new(config)

req = {
  :endpoint => "/clients"
}

puts s.post(req[:endpoint])["body"]
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


