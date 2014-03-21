require "test_helper"

describe AuthenticationsController do

  def raw_post(action, params, body)
    @request.env['RAW_POST_DATA'] = body
    response = post(action, params)
    @request.env.delete('RAW_POST_DATA')
    response
  end

  teardown do
    DatabaseCleaner.clean
  end

  setup do
    @body = {
      :name                  => 'Sebastian Tombs',
      :email                 => 'st@example.com',
      :password              => 'Hirondel',
      :password_confirmation => 'Hirondel'
    }.to_json
  end

  it "must create authentication" do
    assert_difference('Authentication.count') do
      raw_post :create, {:format => :json}, @body
    end
  end

  it "accepts only name, email, password*, and no others" do
    body = {
      :name                  => 'Sebastian Tombs',
      :email                 => 'st@example.com',
      :password              => 'Hirondel',
      :password_confirmation => 'Hirondel',
      :created_at            => Time.at(0),
      :updated_at            => Time.at(0),
      :token                 => "foobarbaz"
    }.to_json
    raw_post :create, {:format => :json}, body
    assigns(:authentication).token.wont_equal 'foobarbaz'
    assigns(:authentication).created_at.wont_equal Time.at(0)
    assigns(:authentication).updated_at.wont_equal Time.at(0)
  end

  # it "includes the token" do
  #   raw_post :create, {:format => :json}, @body
  #   JSON.parse(response.body)[:authentication_token].wont_equal nil
  # end

end
