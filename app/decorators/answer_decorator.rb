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

  def correction_differencies
    return text unless corrected_text
    Rails.cache.fetch([:answer_text_differencies, id]) do
      Differ.format = :html
      highlighting(Differ.diff_by_word(corrected_text, text).to_s).html_safe
    end
  end

  private

  def signing
  	"<span class='label label-primary'><strong>A:</strong></span>"
  end

  def highlighting(raw_string)
    raw_string.gsub('<del class="differ">', '<span class="removed">')
              .gsub('<ins class="differ">', '<span class="added">')
              .gsub('</del>', '</span>').gsub('</ins>', '</span>')
  end
end
