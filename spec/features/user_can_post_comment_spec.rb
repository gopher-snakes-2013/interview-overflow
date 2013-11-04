require 'spec_helper'

describe "User can visit a question page to leave a comment" do
  let!(:question) { create(:question) }
  let!(:comment) { create(:comment) }
  describe 'when visting a question page' do
    it "should post a valid comment" do
      visit question_path(question.id)
      fill_in "comment[content]", with: comment.content
      click_on "Post Comment"
      expect(page).to have_content comment.content
    end
  end
