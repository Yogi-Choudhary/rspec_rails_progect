require "rails_helper"

RSpec.describe Api::V1::ArticlesController, type: :routing do
  let(:articles_url) { "/api/v1/articles" }
  # let(:another_route_url) { "/api/v1/another_route" }

  describe "routing" do
    it "routes to #index" do
      expect(get: articles_url).to route_to("api/v1/articles#index")
    end

    it "routes to #show" do
      expect(get: "#{articles_url}/1").to route_to("api/v1/articles#show", id: "1")
    end

    it "routes to #create" do
      expect(post: articles_url).to route_to("api/v1/articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "#{articles_url}/1").to route_to("api/v1/articles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "#{articles_url}/1").to route_to("api/v1/articles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "#{articles_url}/1").to route_to("api/v1/articles#destroy", id: "1")
    end

    # it "routes to another route" do
    #   expect(get: another_route_url).to route_to("api/v1/another_route#index")
    # end
  end
end
