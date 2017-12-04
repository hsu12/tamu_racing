class AddManageFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :manageFlag, :boolean
  end
end
