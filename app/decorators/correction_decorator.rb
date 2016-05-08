class CorrectionDecorator < Draper::Decorator
  delegate_all

  def correction_status_for(current_user_id)
  	"<span class='label #{label_classes[state]}'>#{label_texts[state]}</span><br><br>".html_safe
  end

  private

  def label_classes
  	{
  	  'verification' => 'label-primary',
  	  'accepted' => 'label-success',
  	  'rejected' => 'label-warning'
  	}
  end

  def label_texts
  	{
  	  'verification' => 'Correction is waiting for werification',
  	  'accepted' => 'Correction accepted',
  	  'rejected' => 'Correction rejected'
  	}
  end
end
