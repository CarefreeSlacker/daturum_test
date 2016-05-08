require "rails_helper"

RSpec.describe CorrectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/corrections").to route_to("corrections#index")
    end

    it "routes to #new" do
      expect(:get => "/corrections/new").to route_to("corrections#new")
    end

    it "routes to #show" do
      expect(:get => "/corrections/1").to route_to("corrections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/corrections/1/edit").to route_to("corrections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/corrections").to route_to("corrections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/corrections/1").to route_to("corrections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/corrections/1").to route_to("corrections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/corrections/1").to route_to("corrections#destroy", :id => "1")
    end

  end
end
