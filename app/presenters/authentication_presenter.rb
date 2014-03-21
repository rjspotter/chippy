class AuthenticationPresenter

  attr_reader :authentication

  def initialize(authentication)
    @authentication = authentication
  end

  def to_json(*args)
    {
      :id                   => authentication.id,
      :name                 => authentication.name,
      :email                => authentication.email,
      :authentication_token => authentication.token,
    }.to_json(*args)
  end

end
