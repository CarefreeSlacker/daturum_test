class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :corrections

  validates :text, presence: true

  def belongs_to(current_user_id)
  	user_id == current_user_id
  end
end
