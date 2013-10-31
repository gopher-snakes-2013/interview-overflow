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

# describe 'GET #index' do
# 	context 'with params[:question]' do
# 			it 'redirects to the root_path' do
# 				question = Question.new
# 				question.title = "The is the title."
# 				question.description = "This describes the title."
# 				question.save
# 				expect(page).to have_content('The is the title')
# 		end
# 	end
# end

