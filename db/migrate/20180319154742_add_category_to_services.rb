class AddCategoryToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :category, :string
  end
end
