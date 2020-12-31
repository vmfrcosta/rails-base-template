class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :complement
      t.string :zipcode
      t.string :reference_point

      t.timestamps
    end
  end
end
