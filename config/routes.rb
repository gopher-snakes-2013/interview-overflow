InterviewOverflow::Application.routes.draw do

  root to: "questions#index"

  resources :questions do
    resources :comments, :only => [:create]
  end



end

