require 'spec_helper'

feature 'User can vote on a question' do

  let(:question){Question.create(title: 'my title', content: 'my content')}

  context 'when on homepage' do

    it 'should see a +1 button' do
      visit root_path
      expect(page).to have_content '+1' 
    end
  end
end

