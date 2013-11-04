require 'spec_helper'

feature 'User can vote on a question' do

  before :each do
    visit root_path
    fill_in('question[title]', with: 'my title')
    fill_in('question[description]', with: 'my content')
    click_button('Submit')
  end

  context 'when on homepage' do

    it 'should see a +1 button' do
      click_button('+1')
    end

    context 'user clicks +1 button' do
      it 'should result in a change in the votes field for that question' do
        click_button('+1')
        expect(Question.first.votes).to eq(1)
      end
    end

  end
end

