require 'spec_helper'

describe QuestionsController do

  describe '#index' do
    it "displays a page" do
      get :index
      response.status.should eq 200
    end

  end

  describe '#create' do
    it "creates a question" do
      expect{
        post :create, post: {title: 'my question', description: 'my descrip'}
        }.to change(Question,:count).by(1)
    end
  end 
end
