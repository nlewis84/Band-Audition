class JsonWebToken < SessionsController
    def self.encode(payload)
      JWT.encode(payload, ENV['JWT_SECRET_KEY'])
    end
  
    def self.decode(token)
      return HashWithIndifferentAccess.new(JWT.decode(token, ENV['JWT_SECRET_KEY'])[0])
    rescue
      nil
    end
end
  