require 'spec_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create(:question) }

	describe '#index' do
    it 'visits the index page' do
      get :index
      expect(response).to render_template(:index)
    end
		it 'should have a successful HTTP response code' do
			get :index
			response.status.should eq(200)
		end
    it 'should list all questions' do
      get :index
      expect(assigns(:questions)).not_to be_nil
    end
  end

  describe '#create' do
    context 'when given valid attributes' do
      it "creates a question" do
        expect{
          post :create, question: {title: question.title, description: question.description }
          }.to change(Question,:count).by(1)
      end
    end
    context 'when given invalid attributes' do
      it 'does not create a question' do
        expect{
          post :create, question: {title: question.title}
        }.to_not change(Question,:count)
      end
    end
  end
end

