class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :token

      t.timestamps
    end
  end
end
