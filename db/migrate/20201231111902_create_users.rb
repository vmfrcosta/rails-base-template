class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone
      t.string :role, default: :user
      t.string :reset_digest
      t.string :facebook_uid
      t.string :facebook_token
      t.string :google_uid
      t.string :google_token
      t.boolean :terms_of_use, default: false
      t.datetime :reset_sent_at
      t.datetime :facebook_expires_at
      t.datetime :google_expires_at
      t.datetime :destroyed_at

      t.timestamps
    end
  end
end
