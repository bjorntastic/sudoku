Rails.application.routes.draw do

  root 'solver#start'

  get '/new' => 'solver#clean_board'

  get '/loop' => 'solver#looper'

end
