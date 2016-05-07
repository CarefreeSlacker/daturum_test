class Correction < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user
  has_one :explanation

  validates :text, presence: true

  state_machine :state, initial: :verification do |
  	state :accepted
  	state :rejected

  	event :accept do
  	  transition :verification => :accepted
  	end

  	event :reject do
  	  transition :verification => :rejected
  	end
  end
end
