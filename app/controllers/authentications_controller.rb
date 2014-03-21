class AuthenticationsController < ApplicationController

  # POST /authentications
  # POST /authentications.json
  def create
    @authentication = AuthenticationGenerator.build(authentication_params)

    respond_to do |format|
      if @authentication.save
        format.json { render :json => AuthenticationPresenter.new(@authentication) }
      else
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      dirty = JSON.parse(request.raw_post)
      {
        :name                  => dirty['name'],
        :email                 => dirty['email'],
        :password              => dirty['password'],
        :password_confirmation => dirty['password_confirmation'],
      }
    end
end
