require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :header => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input#question_header[name=?]", "question[header]"

      assert_select "textarea#question_text[name=?]", "question[text]"
    end
  end
end
