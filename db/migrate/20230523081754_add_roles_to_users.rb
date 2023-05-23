class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :roles, :jsonb, null: false, default: {}
    add_index  :users, :roles, using: :gin
  end
end
