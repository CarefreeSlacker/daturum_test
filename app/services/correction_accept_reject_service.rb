class CorrectionAcceptRejectService
  attr_reader :correction, :params	
  def initialize(update_correction, update_parameters)
  	@correction = update_correction
  	@params = update_parameters
  end

  def perform
  	return unless ['Accept','Reject'].include?(params[:commit])
  	correction.send(params[:commit].downcase.to_sym)
  end
end