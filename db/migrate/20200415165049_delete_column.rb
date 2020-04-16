class DeleteColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :active
  end
end
