class AddUserIdToCorrections < ActiveRecord::Migration
  def change
  	add_column :corrections, :user_id, :integer
  	add_index :corrections, :user_id
  end
end
