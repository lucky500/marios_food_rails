class AddDatetimeColumnToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :created_at, :datetime, null: false
    add_column :products, :updated_at, :datetime, null: false
  end
end
