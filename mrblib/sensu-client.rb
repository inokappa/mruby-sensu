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
        'Authorization'  => "Basic " + auth,
      }
    end

    def url
      if @port
        @host + ":" + @port
      else
        @host
      end
    end

    def post(req)
      http = HttpRequest.new()
      api_endpoint = [ url, req[:endpoint] ]
      http.get(api_endpoint.join("/"), nil, @header)
    end

    def auth
      auth_data = [ @user, ":" , @pass ]
      Base64.encode(auth_data.join)
    end
  end
end
