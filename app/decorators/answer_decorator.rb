class AnswerDecorator < Draper::Decorator
  delegate_all

  def correction_status_for(current_user_id)
  	if corrections.map(&:user_id).include?(current_user_id)
  	  "<span class='label label-info'>You have allready corrected this question</span><br><br>".html_safe
  	elsif user_id == current_user_id && corrections.any? && corrections.where(state: 'verification').any?
  	  "<span class='label label-danger'>You do have some corrections</span><br><br>".html_safe
  	end
  end
end
