# Sensu API client for mruby

## require mrbgems

 * mruby-httprequest
 * mruby-json
 * mruby-base64

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
  :endpoint => "checks"
}

JSON::parse(s.post(req)["body"]).each do |res|
  p res
end
```

## Thanks!!

 * [matsumoto-r/mruby-httprequest](https://github.com/matsumoto-r/mruby-httprequest)
 * [matsumoto-r/mruby-zabbix](https://github.com/matsumoto-r/mruby-zabbix)
 * [mattn/mruby-base64](https://github.com/mattn/mruby-base64)

## License

under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


