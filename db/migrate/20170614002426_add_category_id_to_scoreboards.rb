class AddCategoryIdToScoreboards < ActiveRecord::Migration
  def change
    add_column :scoreboards, :category_id, :integer
  end
end
