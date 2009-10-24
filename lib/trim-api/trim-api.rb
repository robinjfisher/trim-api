module TrimApi
  
  API_URL = "http://api.tr.im/api/"
  
  class TrimError < StandardError
    
    def initialize(code, message)
      super("#{code} - #{message}")
    end
    
  end
  
  class Trim
    
    attr_accessor :username
    attr_accessor :password
    
    def initialize(options = {})
      @client = HTTPClient.new
      self.username = options[:username] if options[:username]
      self.password = options[:password] if options[:password]
    end
    
    def trim(original_url, options = {})
      raise ArgumentError.new(":url to shorten is required") if original_url.nil?
      response = @client.get_content(create_url("trim_url", :url => original_url))
      data = JSON.parse(response)
      unless data["status"]["result"] == "OK"
        raise TrimError.new(data["status"]["code"],data["status"]["message"])
      else
        "http://tr.im/#{data['url']}"
      end
    end
    
    def trim_destination(trimmed_url, options = {})
      raise ArgumentError.new(":trimmed url is required") if trimmed_url.nil?
      raise ArgumentError.new(":username and password are required") if (username.nil? || password.nil?)
      response = @client.get_content(create_url("trim_destination",options.merge!({:trimpath => trimmed_url, :username => username, :password => password})))
      data = JSON.parse(response)
      unless data["status"]["result"] == "OK"
        raise TrimError.new(data["status"]["code"],data["status"]["message"])
      else
        data["destination"]
      end
    end
    
    def trim_reference(trimmed_url, options = {})
      raise ArgumentError.new(":trimmed url is required") if trimmed_url.nil?
      raise ArgumentError.new(":username and password are required") if (username.nil? || password.nil?)
      response = @client.get_content(create_url("trim_reference", options.merge!({:trimpath => trimmed_url, :username => username, :password => password})))
      data = JSON.parse(response)
      unless data["status"]["result"] == "OK"
        raise TrimError.new(data["status"]["code"],data["status"]["message"])
      else
        data["reference"]
      end
    end
    
    def trim_claim(reference, options = {})
      raise ArgumentError.new(":url reference is required. Use trim_reference to obtain this.") if reference.nil?
      raise ArgumentError.new(":username and password are required") if (username.nil? || password.nil?)
      response = @client.get_content(create_url("trim_claim", options.merge!({:reference => reference, :username => username, :password => password})))
      data = JSON.parse(response)
      unless data["status"]["result"] == "OK"
        raise TrimError.new(data["status"]["code"],data["status"]["message"])
      else
        "URL successfully claimed and added to your account"
      end
    end
    
    private
    
    def create_url(method, options = {})
      base_url = "#{API_URL}#{method}.json?"
      options = options.map { |k,v| "%s=%s" % [CGI.escape(k.to_s), CGI.escape(v.to_s)] }.join("&")
      base_url + options
    end
    
  end
  
end