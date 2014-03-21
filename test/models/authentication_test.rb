require "test_helper"

describe Authentication do

  before do
    @params = {
      :name                  => 'Simon',
      :email                 => 'st@example.com',
      :password              => 'SuperSecret',
      :password_confirmation => 'SuperSecret',
      :token                 => 'asdf'}
    @authentication = Authentication.new(@params)
  end

  it "must be valid" do
    @authentication.valid?.must_equal true
  end

  it "must have unique email" do
    Authentication.create(@params)

    @authentication = Authentication.new(@params)
    @authentication.valid?.must_equal false
  end

  it "does basic email format checking" do
    params = @params.dup
    params[:email] = "withoutatdomain.com"
    @authentication = Authentication.new(params)
    @authentication.valid?.must_equal false
    params[:email] = "valid@notld"
    @authentication = Authentication.new(params)
    @authentication.valid?.must_equal false
    DatabaseCleaner.clean
  end
end
