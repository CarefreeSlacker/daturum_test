class CorrectionDecorator < Draper::Decorator
  delegate_all

  def label(current_user_id)
  	question_belongs_to_current_user = user_id == current_user_id
  	label_class = question_belongs_to_current_user ? 'label-success' : 'label-primary'
  	label_user_name = question_belongs_to_current_user ? "You're" : user.name
  	question_time = I18n.l(created_at, format: '%H:%M %d.%m.%y' )
    "#{signing}<span class='label #{label_class}'>Wrote: #{label_user_name}, at: #{question_time}</span>".html_safe
  end

  def correction_status_for(current_user_id)
  	"<span class='label #{label_classes[state]}'>#{label_texts[state]}</span><br><br>".html_safe
  end

  private

  def signing
  	"<span class='label label-primary'><strong>C:</strong></span>"
  end

  def label_classes
  	{
  	  'verification' => 'label-primary',
  	  'accepted' => 'label-success',
  	  'rejected' => 'label-warning'
  	}
  end

  def label_texts
  	{
  	  'verification' => 'Correction is waiting for verification',
  	  'accepted' => 'Correction accepted',
  	  'rejected' => 'Your correction rejected'
  	}
  end
end
