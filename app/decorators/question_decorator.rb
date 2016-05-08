class QuestionDecorator < Draper::Decorator
  delegate_all

  def label(current_user_id)
    question_belongs_to_current_user = user_id == current_user_id
    label_class = question_belongs_to_current_user ? 'label-success' : 'label-primary'
    label_user_name = question_belongs_to_current_user ? "You're" : user.name
    question_time = I18n.l(created_at, format: '%H:%M %d.%m.%y' )
    "#{signing}<span class='label #{label_class}'>Wrote: #{label_user_name}, at: #{question_time}</span>".html_safe
  end

  def answer_status_for(current_user_id)
  	return unless answers.map(&:user_id).include?(current_user_id)
  	"<span class='label label-info'>You have allready answered this question</span><br><br>".html_safe
  end

  def text_for_answer(current_user_id)
    answers.map(&:user_id).include?(current_user_id) ? 'Make another answer' : 'Make answer'
  end

  private

  def signing
    "<span class='label label-primary'><strong>Q:</strong></span>"
  end
end
