Rails.application.routes.draw do

  root 'solver#start'

  get '/solve' => 'solver#solve'

end
