class AddOrderCountToImportFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :import_files, :order_count, :integer, default: 0
  end
end
