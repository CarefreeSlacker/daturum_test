class AnswerDecorator < Draper::Decorator
  delegate_all

  def correction_status_for(current_user_id)
  	return unless corrections.map(&:user_id).include?(current_user_id)
  	"<span class='label label-info'>You have allready corrected this question</span><br><br>".html_safe
  end
end
