class CreateScoreboards < ActiveRecord::Migration
  def change
    create_table :scoreboards do |t|
      t.string :bpecode
      t.string :organization
      t.text :code
      t.text :description

      t.timestamps null: false
    end
  end
end
