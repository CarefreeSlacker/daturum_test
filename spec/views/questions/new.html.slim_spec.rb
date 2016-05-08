require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :header => "MyString",
      :text => "MyText"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input#question_header[name=?]", "question[header]"

      assert_select "textarea#question_text[name=?]", "question[text]"
    end
  end
end
