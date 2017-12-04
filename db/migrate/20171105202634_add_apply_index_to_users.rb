class AddApplyIndexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apply0, :integer
    add_column :users, :apply1, :integer
    add_column :users, :apply2, :integer
  end
end
