class AuthenticationGenerator

  def self.build(args)
    args.reverse_merge!(:token => random_token)
    Authentication.new(args)
  end

  def self.random_token
    SecureRandom.hex
  end

end
