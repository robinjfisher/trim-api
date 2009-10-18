module TrimApi
  
  class TrimError < StandardError
  end
  
  class Trim
    
    attr_accessor :username
    attr_accessor :password
    attr_accessor :api_key
    
    def initialize(options = {})
      
    end
    
  end
  
end