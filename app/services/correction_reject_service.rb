class CorrectionRejectService
  attr_reader :correction, :params	

  def initialize(update_correction, update_parameters)
  	@correction = update_correction
  	@params = update_parameters
  end

  def perform
  	correction.reject
  	correction.update(params) if params[:explanation_attributes][:text].present?
  	true
  end
end