class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :header, presence: true
  validates :text, presence: true

  self.per_page = 20
end
