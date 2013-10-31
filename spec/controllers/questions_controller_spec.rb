require 'spec_helper'

describe QuestionsController do 	
	context 'index' do	
		it 'should provide a list of questions' do
			get :index
			expect(assigns(:questions)).not_to be_nil
		end

		it 'should have a successful HTTP response code' do
			get :index
			response.status.should eq(200)
		end
  end

  describe '#create' do
    it "creates a question" do
      expect{
        post :create, question: {title: 'my question', description: 'my descrip'}
        }.to change(Question,:count).by(1)
    end
  end
end

