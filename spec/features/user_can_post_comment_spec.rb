require 'spec_helper'

describe "User vists a question page" do
  let!(:question) { create(:question) }
  let!(:comment) { create(:comment) }

  it "can add a comment" do
    visit question_path(question.id)
    fill_in "comment[content]", with: comment.content
    click_on "Post Comment"
    expect(page).to have_content comment.content
  end
end