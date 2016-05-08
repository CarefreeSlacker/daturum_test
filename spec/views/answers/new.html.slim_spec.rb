require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      :user_id => "MyString",
      :question_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_user_id[name=?]", "answer[user_id]"

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_text[name=?]", "answer[text]"
    end
  end
end
