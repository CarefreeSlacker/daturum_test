class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|
      t.belongs_to :answer, index: true
      t.string :text
      t.string :state
      t.timestamps null: false
    end
  end
end
