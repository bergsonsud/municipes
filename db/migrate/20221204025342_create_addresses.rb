class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :municipe, null: false, foreign_key: true
      t.string :zipcode
      t.string :name
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :ibge_code

      t.timestamps
    end
  end
end
