class AddCorrectedTextToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :corrected_text, :string
  end
end
