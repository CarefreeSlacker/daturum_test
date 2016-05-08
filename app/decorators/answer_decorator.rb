class AnswerDecorator < Draper::Decorator
  delegate_all

  def label(current_user_id)
  	question_belongs_to_current_user = user_id == current_user_id
  	label_class = question_belongs_to_current_user ? 'label-success' : 'label-primary'
  	label_user_name = question_belongs_to_current_user ? "You're" : user.name
  	question_time = I18n.l(created_at, format: '%H:%M %d.%m.%y' )
    "#{signing}<span class='label #{label_class}'>Wrote: #{label_user_name}, at: #{question_time}</span>".html_safe
  end

  def correction_status_for(current_user_id)
  	if corrections.map(&:user_id).include?(current_user_id)
  	  "<span class='label label-info'>You have allready corrected this answer</span><br><br>".html_safe
  	elsif user_id == current_user_id && corrections.any? && corrections.where(state: 'verification').any?
  	  "<span class='label label-danger'>You do have some corrections</span><br><br>".html_safe
  	end
  end

  private

  def signing
  	"<span class='label label-primary'><strong>A:</strong></span>"
  end
end
