class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :header, presence: true
  validates :text, presence: true

  self.per_page = 20

  scope :with_related_data, -> { includes(:user, answers: [corrections: :explanation]).order(created_at: :desc) }
end
