class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true
      t.string :header
      t.text :text
      t.timestamps null: false
    end
  end
end
