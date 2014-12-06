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
