class AddCommentToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :admission, :boolean
    add_column :applies, :comment, :text
  end
end
