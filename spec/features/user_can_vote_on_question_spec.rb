require 'spec_helper'

feature 'User can vote up a question' do
  before :each do
    visit root_path
    fill_in('question[title]', with: 'Do you hate short people?')
    fill_in('question[description]', with: "Just because I'm tall doesn't mean I hate short people.")
    click_button('Submit')
  end
  context 'when visiting homepage with a list of Question posts' do
    # emtpy test
    it 'should see a +1 button next to the question' do
      click_button('+1')
    end
  end
  context 'when user clicks +1 button' do
    it 'should increment the votes count for that question' do
      click_button('+1')
      expect(Question.first.votes).to eq(1)
    end
  end
end
