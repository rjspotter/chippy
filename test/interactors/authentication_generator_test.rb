require "test_helper"

describe AuthenticationGenerator do

  it "adds a random token to the params for Authentication" do
    SecureRandom.stub(:hex, 'asdf') do
      res = AuthenticationGenerator.build(:name                  => 'Simon',
                                          :email                 => 'st@example.com',
                                          :password              => 'SuperSecret',
                                          :password_confirmation => 'SuperSecret')
      res.valid?.must_equal true
      res.token.must_equal 'asdf'
    end
  end

  it "does not overwrite a token set by the caller" do
    SecureRandom.stub(:hex, 'asdf') do
      res = AuthenticationGenerator.build(:name                  => 'Simon',
                                          :email                 => 'st@example.com',
                                          :password              => 'SuperSecret',
                                          :password_confirmation => 'SuperSecret',
                                          :token                 => 'qwerty')
      res.valid?.must_equal true
      res.token.must_equal 'qwerty'
    end
  end

end
