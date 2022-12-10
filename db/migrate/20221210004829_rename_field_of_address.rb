class RenameFieldOfAddress < ActiveRecord::Migration[7.0]
  def up
    rename_column :addresses, :name, :street
  end

  def down
    rename_column :addresses, :street, :name
  end
end
