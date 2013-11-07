require 'spec_helper'

describe CommentsController do
  let!(:question) { create(:question) }

  describe "#create" do
    context "when given valid params" do
      it "should create a comment" do
        expect {
          post :create, question_id: question.id, comment: attributes_for(:comment)
        }.to change{Comment.count}.by(1)
      end
    end
    context "when given invalid params"
    it "should not create a comment" do
      expect {
        post :create, question_id: question.id, comment: { content: " " }
      }.not_to change{Comment.count}
    end
  end
end
