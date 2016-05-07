require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :user_id => "MyString",
      :question_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(@answer), "post" do

      assert_select "input#answer_user_id[name=?]", "answer[user_id]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_text[name=?]", "answer[text]"
    end
  end
end
