class Sensu
  class Client
    def initialize(config)
      @host  = config[:host]
      @port  = config[:port]
      @user = config[:user]
      @pass = config[:pass]
      @ua   = config[:ua]
      @header = {
        'Content-Type'   => "application/json-rpc",
        'User-Agent'     => @ua,
      }
    end
    def headers
      @header
    end
    def url
      if @port 
        @host + ":" + @port
      else
        @host
    end
    def post(req)
      #auth
      http = HttpRequest.new()
      http.get(url, req)
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
