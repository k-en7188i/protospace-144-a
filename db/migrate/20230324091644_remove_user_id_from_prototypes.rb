class RemoveUserIdFromPrototypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :prototypes, :user_id, :integer
  end
end
