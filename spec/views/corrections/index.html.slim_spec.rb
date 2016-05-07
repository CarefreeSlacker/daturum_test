require 'rails_helper'

RSpec.describe "corrections/index", type: :view do
  before(:each) do
    assign(:corrections, [
      Correction.create!(
        :user_id => "User",
        :answer_id => "Answer",
        :text => "Text"
      ),
      Correction.create!(
        :user_id => "User",
        :answer_id => "Answer",
        :text => "Text"
      )
    ])
  end

  it "renders a list of corrections" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
