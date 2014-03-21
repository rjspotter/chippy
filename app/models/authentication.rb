class Authentication < ActiveRecord::Base
  has_secure_password

  validates :name, :email, :password, :token, :presence => true

  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create },
            uniqueness: true
end
