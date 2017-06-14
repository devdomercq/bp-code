class AddAttachmentScoreboardImgToScoreboards < ActiveRecord::Migration
  def self.up
    change_table :scoreboards do |t|
      t.attachment :scoreboard_img
    end
  end

  def self.down
    remove_attachment :scoreboards, :scoreboard_img
  end
end
