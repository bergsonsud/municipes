class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :name
      t.string :cpf
      t.bigint :cns
      t.string :email
      t.date :birthdate
      t.string :phone
      t.boolean :status

      t.timestamps
    end
  end
end
