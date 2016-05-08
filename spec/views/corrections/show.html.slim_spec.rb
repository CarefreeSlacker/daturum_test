require 'rails_helper'

RSpec.describe "corrections/show", type: :view do
  before(:each) do
    @correction = assign(:correction, Correction.create!(
      :user_id => "User",
      :answer_id => "Answer",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(/Text/)
  end
end
