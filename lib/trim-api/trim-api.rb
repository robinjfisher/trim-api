module TrimApi
  
  API_URL = "http://api.tr.im/api/"
  
  class TrimError < StandardError
  end
  
  class Trim
    
    def initialize(options = {})
      @client = HTTPClient.new
    end
    
    def trim(original_url)
      raise ArgumentError.new(":url to shorten is required") if original_url.nil?
      response = @client.get_content(create_url(original_url))
      data = JSON.parse(response)
      data["url"]
    end
    
    private
    
    def create_url(original_url)
      base_url = "#{API_URL}trim_url.json?"
      url = "url=#{CGI::escape(original_url)}"
      base_url + url
    end
    
  end
  
end