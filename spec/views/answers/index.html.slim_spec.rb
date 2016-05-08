require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :user_id => "User",
        :question_id => "Question",
        :text => "Text"
      ),
      Answer.create!(
        :user_id => "User",
        :question_id => "Question",
        :text => "Text"
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
