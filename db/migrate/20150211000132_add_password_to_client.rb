class AddPasswordToClient < ActiveRecord::Migration
  def change
    add_column :clients, :password, :string
  end
end
