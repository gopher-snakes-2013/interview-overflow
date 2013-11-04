require 'spec_helper'

feature 'Guest can post a question' do
  context 'with valid question and question description' do
    it 'posts the new question' do
      expect{
        visit root_path
        fill_in 'Question', with: "What are your weaknesses?"
        fill_in 'Question Details', with: "I don't have any weaknesses, so should I lie to make myself look normal?"
        click_button "Submit Question"
      }.to change(Question,:count).by(1)
    end
  end
  context 'with no question' do
    it 'does not post the new question' do
      expect{
        visit root_path
        fill_in 'Question', with: ""
        fill_in 'Question Details', with: "Will this post without an actual Question?"
        click_button "Submit Question"
      }.to_not change(Question,:count)
    end
  end
  context 'with no question description' do
    it 'does not post the new question' do
      expect{
        visit root_path
        fill_in 'Question', with: "Will this post with just the question?"
        fill_in 'Question Details', with: ""
        click_button "Submit Question"
      }.to_not change(Question,:count)
    end
  end
  context 'with question that is too short' do
    it 'does not post the new question' do
      expect{
        visit root_path
        fill_in 'Question', with: "Why?"
        fill_in 'Question Details', with: "Will this post with a really short Question?"
        click_button "Submit Question"
      }.to_not change(Question,:count)
    end
  end
  context 'with question description too short' do
    it 'does not post the new question' do
      expect{
        visit root_path
        fill_in 'Question', with: "Will this post with a question description that is too short?"
        fill_in 'Question Details', with: "what?"
        click_button "Submit Question"
      }.to_not change(Question,:count)
    end
  end
end