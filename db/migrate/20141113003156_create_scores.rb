class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :scores
      t.references :user, index: true

      t.timestamps
    end
  end
end
