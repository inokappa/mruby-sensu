# Sensu API client for mruby

require mruby-httprequest mruby-json

## install by mrbgems
```bash
git clone git://github.com/inokappa/mruby-sensu.git
cp -pr mruby-sensu ${MRUBY_ROOT}/mrbgems/g/.
echo mruby-sensu >> ${MRUBY_ROOT}/mrbgems/GEMS.active
cd ${MRUBY_ROOT}
make
./bin/mruby ${MRUBY_ROOT}/mrbgems/g/mruby-sensu/example/sensu-api-cient.rb
```

## example

```ruby
config = {
  :url  => "http://127.0.0.4567", 
  :ua   => "mruby-sensu",
  :user => "",
  :pass => "",
}

s = Sensu::Client.new(config)

data = {
  :method => "get",
  :object => "clients",
  :params => {
               :output => "extend",
               :filter => {
                            :host    =>  "example.com",
                          },
             },
}

puts "request:  #{JSON::stringify(data)}"
puts "response: #{s.post(data)["body"]}"
```

# License
under the MIT License:

* http://www.opensource.org/licenses/mit-license.php


