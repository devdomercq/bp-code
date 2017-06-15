class AddEventdateToScoreboards < ActiveRecord::Migration
  def change
    add_column :scoreboards, :eventdate, :date
  end
end
