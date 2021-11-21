class Fixuserid < ActiveRecord::Migration[6.1]
  def change
    rename_column :surveys, :users_id, :user_id
  end
end
