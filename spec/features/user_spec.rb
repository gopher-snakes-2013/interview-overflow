require 'spec_helper'

feature 'Guest can make a question' do

  context 'on homepage' do

    it 'can submit a new question' do
      expect{
        visit root_path
        fill_in 'Question', with: "What are your weaknesses?"
        fill_in 'Question Details', with: "How can I not small?"
        click_button "Submit Question"
      }.to change(Question,:count).by(1)
    end

  end

end

# feature 'Guest can click question title link' do
#   context 'on homepage' do
#     it 'can click on a title link' do
      
#     end
#   end
# end
