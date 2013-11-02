require 'spec_helper'

describe CommentsController do
  let!(:question) { create(:question) }
  let!(:comment) {create(:comment)}

  context "#create" do
    it "creates comment with valid params" do
      expect {
        post :create, question_id: question.id, comment: attributes_for(:comment)
      }.to change{Comment.count}.by(1)
    end

    it "should not create comment with invalid params" do
      expect {
        post :create, question_id: question.id, comment: { content: " " }
      }.not_to change{Comment.count}
    end
  end
end
