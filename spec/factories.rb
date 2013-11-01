FactoryGirl.define do

  factory :question do
    title "Do you like eggs?"
    description "No, really. Do you like eggs?"
  end

  factory :comment do
    content "Only if they're green with ham"
    question
  end
end