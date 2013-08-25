class AddFkToComments < ActiveRecord::Migration
  def up
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
  end
end
