class AddUserIdToScoreboards < ActiveRecord::Migration
  def change
    add_column :scoreboards, :user_id, :integer
  end
end
