class Explanation < ActiveRecord::Base
  belongs_to :correction

  validates :text, presence: true
end
