require 'spec_helper'

describe CommentsController do
  let!(:question) {Question.create(title: "My question", description: "How should I do this?")}
  let!(:comment) {Comment.new(content: "You should do this...")}

  context "#create" do
    it "creates comment with valid params" do
      expect {
        post :create, question_id: question.id, comment: { content:  comment.content}
      }.to change{Comment.count}.by(1)
    end
    it "should not create comment with invalid params" do
      expect {
        post :create, question_id: question.id, comment: { content: " " }
      }.not_to change{Comment.count}
    end
  end
end
