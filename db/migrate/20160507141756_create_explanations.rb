class CreateExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.belongs_to :correction, index: true
      t.string :text
      t.timestamps null: false
    end
  end
end
