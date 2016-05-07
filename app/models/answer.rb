class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :corrections

  validates :text, presence: true
end
