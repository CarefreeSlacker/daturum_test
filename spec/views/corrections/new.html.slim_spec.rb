require 'rails_helper'

RSpec.describe "corrections/new", type: :view do
  before(:each) do
    assign(:correction, Correction.new(
      :user_id => "MyString",
      :answer_id => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new correction form" do
    render

    assert_select "form[action=?][method=?]", corrections_path, "post" do

      assert_select "input#correction_user_id[name=?]", "correction[user_id]"

      assert_select "input#correction_answer_id[name=?]", "correction[answer_id]"

      assert_select "input#correction_text[name=?]", "correction[text]"
    end
  end
end
