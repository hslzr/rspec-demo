require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:tweet) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:tweet, :invalid) }

  describe "GET #index" do
    it "assigns all tweets as @tweets" do
      tweet = FactoryGirl.create(:tweet)
      get :index, params: {}
      expect(assigns(:tweets)).to eq([tweet])
    end
  end

  describe "GET #show" do
    it "assigns the requested tweet as @tweet" do
      tweet = FactoryGirl.create(:tweet)
      get :show, params: {id: tweet.to_param}
      expect(assigns(:tweet)).to eq(tweet)
    end
  end

  describe "GET #new" do
    it "assigns a new tweet as @tweet" do
      get :new, params: {}
      expect(assigns(:tweet)).to be_a_new(Tweet)
    end
  end

  describe "GET #edit" do
    it "assigns the requested tweet as @tweet" do
      tweet = FactoryGirl.create(:tweet)
      get :edit, params: {id: tweet.to_param}
      expect(assigns(:tweet)).to eq(tweet)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tweet" do
        expect {
          post :create, params: {tweet: attributes_for(:tweets)}
        }.to change(Tweet, :count).by(1)
      end

      it "assigns a newly created tweet as @tweet" do
        post :create, params: {tweet: attributes_for(:tweet)}
        expect(assigns(:tweet)).to be_a(Tweet)
        expect(assigns(:tweet)).to be_persisted
      end

      it "redirects to the created tweet" do
        post :create, params: {tweet: valid_attributes}
        expect(response).to redirect_to(Tweet.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved tweet as @tweet" do
        post :create, params: {tweet: invalid_attributes}
        expect(assigns(:tweet)).to be_a_new(Tweet)
      end

      it "re-renders the 'new' template" do
        post :create, params: {tweet: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, params: {id: tweet.to_param, tweet: new_attributes}
        tweet.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, params: {id: tweet.to_param, tweet: valid_attributes}
        expect(assigns(:tweet)).to eq(tweet)
      end

      it "redirects to the tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, params: {id: tweet.to_param, tweet: valid_attributes}
        expect(response).to redirect_to(tweet)
      end
    end

    context "with invalid params" do
      it "assigns the tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, params: {id: tweet.to_param, tweet: invalid_attributes}
        expect(assigns(:tweet)).to eq(tweet)
      end

      it "re-renders the 'edit' template" do
        tweet = Tweet.create! valid_attributes
        put :update, params: {id: tweet.to_param, tweet: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete :destroy, params: {id: tweet.to_param}
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      tweet = Tweet.create! valid_attributes
      delete :destroy, params: {id: tweet.to_param}
      expect(response).to redirect_to(tweets_url)
    end
  end

end
