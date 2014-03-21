require "test_helper"

describe AuthenticationPresenter do

  describe "#to_json" do

    it "returns only values for id, name, email, and token" do
      authentication = Authentication.new(:id => 1,
                                          :name => 'Simon Templar',
                                          :email => 'st@example.com',
                                          :token => 'asdfasdf')
      subject = JSON.parse(AuthenticationPresenter.new(authentication).to_json)
      subject.keys.sort.must_equal %w[id name email authentication_token].sort
      subject['id'].must_equal 1
      subject['name'].must_equal 'Simon Templar'
      subject['email'].must_equal 'st@example.com'
      subject['authentication_token'].must_equal 'asdfasdf'
    end
  end

end
