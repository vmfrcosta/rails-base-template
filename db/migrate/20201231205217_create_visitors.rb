class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.string :user_agent
      t.string :accept_language
      t.string :platform

      t.timestamps
    end
  end
end
