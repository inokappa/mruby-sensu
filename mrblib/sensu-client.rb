class Sensu
  class Client
    def initialize(config)
      @url  = config[:url]
      #@user = config[:user]
      #@pass = config[:pass]
      @ua   = config[:ua]
      @request = {
        'Content-Type'   => "application/json-rpc",
        'User-Agent'     => @ua,
      }
    end
    def headers
      @request
    end
    def post(data)
      #auth
      method = data[:object] + "." + data[:method] 
      req_json = {
        :jsonrpc => "2.0",
        :method  => method,
        :params  => data[:params],
        #:auth    => @atoken,
      }
      http = HttpRequest.new()
      http.get(@url, JSON::stringify(req_json), @request)
    end
    def auth
      auth_data = {
        :auth        =>  nil,
        :jsonrpc     =>  "2.0",
        :method      =>  "user.login",
        :params      =>  {   
                            :user        => @user,
                            :password    => @pass,
                        },
      }
      http = HttpRequest.new()
      response = http.get(@url, JSON::stringify(auth_data), @request)
      @atoken = JSON::parse(response["body"])["result"]
    end
  end
end
