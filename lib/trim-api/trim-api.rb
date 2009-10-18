module TrimApi
  
  class TrimError < StandardError
  end
  
  class Trim
    
    def initialize(options = {})
      @client = HTTPClient.new
    end
    
    def trim(original_url, options = {})
      raise ArgumentError.new(":url to shorten is required") if original_url.nil?
      response = @client.get_content(create_url(original_url, options))
      data = JSON.parse(response)
      raise TrimError.new(data["status"]["result"]) unless data["status"]["code"] == "200"?
      data["url"]
    end
    
    private
    
    def create_url(original_url, options)
      base_url = "http://api.tr.im/api/trim_url.json?"
      url = "url=#{CGI::escape(url)}"
      if !options.nil?
        base_url + url
      else
        options = options.map { |k,v| "%s=%s" % [CGI::escape(k.to_s), CGI::escape(v.to_s)] }.join("&")
        base_url + url + options
      end
    end
    
  end
  
end