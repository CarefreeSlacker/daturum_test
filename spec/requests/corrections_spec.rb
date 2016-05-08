require 'rails_helper'

RSpec.describe "Corrections", type: :request do
  describe "GET /corrections" do
    it "works! (now write some real specs)" do
      get corrections_path
      expect(response).to have_http_status(200)
    end
  end
end
