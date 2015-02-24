class AddColumnClientToSell < ActiveRecord::Migration
  def change
  	add_column :sells, :client_id, :integer
  end
end
