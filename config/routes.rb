RoamingRover::Application.routes.draw do

  resources :activities

  #Render homepage
  root 'greeting#index'

  #Render first signup process
  get 'signup/' => 'signup#signup_type'
  
  #Post signup data from first page
  post 'signup/2' => 'signup#signup2'

  #Send over to second part of the signup process
  get 'signup/2' => 'signup#signup'

  #Finish signup
  get 'signup/3' => 'signup#select'
  post 'signup/3' => 'signup#signup3'

  #Select the right dashboard based on user type
  get 'dashboard/' => 'dashboard#select'

  #Post for setting session for user type on signup
  post 'signup/set/user_type/' => 'signup#set_user_type'

  #Reset session on command
  get 'reset/' => 'reset#reset_session'
end
