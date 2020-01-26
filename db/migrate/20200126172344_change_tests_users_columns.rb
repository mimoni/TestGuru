class ChangeTestsUsersColumns < ActiveRecord::Migration[6.0]
  def change
    remove_index :tests_users, :test_id
    remove_index :tests_users, :user_id

    add_index(:tests_users, [:test_id, :user_id], unique: true)
  end
end
