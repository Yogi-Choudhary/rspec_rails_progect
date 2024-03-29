require 'rails_helper'


RSpec.describe "Api::V1::ArticlesController", type: :request do
  
  let(:valid_attributes) do
    {
      title: "articlee",
      body: "some articles",
      user_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      title: nil,
      body: nil,
      user_id: 1

    } 
  end

  let(:valid_headers) {
    {}
  }

  let(:articles_url){"/api/v1/articles"}
  let(:article_url){"/api/v1/articles"}

  describe "GET /index" do
    it "renders a successful response" do
      Article.create! valid_attributes
      get articles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      article = Article.create! valid_attributes
      binding.pry
      get article_url+ "/#{article.id}", as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Article" do
        expect {
          post articles_url,
               params: { article: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Article, :count).by(1)
      end

      it "renders a JSON response with the new article" do
        post articles_url,
             params: { article: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Article" do
        expect {
          post articles_url,
               params: { article: invalid_attributes }, as: :json
        }.to change(Article, :count).by(0)
      end

      it "renders a JSON response with errors for the new article" do
        post articles_url,
             params: { article: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        binding.pry
        patch article_url+ "/#{article.id}",
              params: { article: new_attributes }, headers: valid_headers, as: :json
        article.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the article" do
        article = Article.create! valid_attributes
        patch article_url+ "/#{article.id}",
              params: { article: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the article" do
        article = Article.create! valid_attributes
        patch article_url+ "/#{article.id}",
              params: { article: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete article_url+ "/#{article.id}", headers: valid_headers, as: :json
      }.to change(Article, :count).by(-1)
    end
  end
end
