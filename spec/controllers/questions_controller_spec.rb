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
      it "redirects to the root path" do
        expect(response.status).to eq(200)
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
  describe '#show' do
    it 'visits the question page' do
      get :show, id: question.id
      expect(response).to render_template(:show)
    end
  end
  describe '#update' do
    context 'when a guest or user votes' do
      it "increments the votes for a question's votes" do
        @question = Question.create(title: question.title, description: question.description)
        post :update, id: @question.id
        expect(Question.find(@question.id).votes).to eq(1)
      end
    end
  end
end

