require 'rails_helper'

RSpec.describe "corrections/edit", type: :view do
  before(:each) do
    @correction = assign(:correction, Correction.create!(
      :user_id => "MyString",
      :answer_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit correction form" do
    render

    assert_select "form[action=?][method=?]", correction_path(@correction), "post" do

      assert_select "input#correction_user_id[name=?]", "correction[user_id]"

      assert_select "input#correction_answer_id[name=?]", "correction[answer_id]"

      assert_select "input#correction_text[name=?]", "correction[text]"
    end
  end
end
