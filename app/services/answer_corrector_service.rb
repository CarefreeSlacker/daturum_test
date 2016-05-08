class AnswerCorrectorService
  include ActiveModel::Validations

  attr_reader :answer, :params, :correction

  validate :correction_presence
  validate :answer_correction_text_is_valid

  def initialize(correction_answer, answer_parameters)
  	@answer = correction_answer
  	@correction = Correction.find_by(id: answer_parameters['corrections_attributes']['0']['id'])
  	@params = answer_parameters.reject!{ |key| key == 'corrections_attributes' }
  end

  def perform
  	if valid?  	  
  	  correction.accept
  	else
  	  false  
  	end
  end

  private

  def correction_presence
  	unless correction
  	  self.errors.add(:base, 'Correction is abscent')
  	end
  end

  def answer_correction_text_is_valid
  	unless answer.update(params)
  	  self.errors.add(:base, answer.errors.full_messages)
  	end
  end
end