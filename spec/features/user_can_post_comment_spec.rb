require 'spec_helper'

feature "User can visit a question page to leave a comment" do
  let(:args) {{title: question.title, description: question.description}}
  let!(:new_question) {Question.create(args)}
  let!(:question) { create(:question) }
  let!(:comment) { create(:comment) }
  describe 'when visting a question page' do
    it "should post a valid comment" do
      visit question_path(question.id)
      fill_in "comment[content]", with: comment.content
      click_on "Post Comment"
      expect(page).to have_content comment.content
    end
    it "should add a comment to the database" do
      visit question_path(question.id)
      fill_in "comment[content]", with: comment.content
      expect{
        click_on "Post Comment"
      }.to change(Comment, :count).by(1)
    end
    it "should not post an invalid comment" do
      visit question_path(question.id)
      fill_in "comment[content]", with: "What?"
      expect{
        click_on "Post Comment"
      }.not_to change(Comment, :count)
    end
  end
end
