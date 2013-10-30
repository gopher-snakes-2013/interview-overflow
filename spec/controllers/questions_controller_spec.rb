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
end