Rails.application.routes.draw do

  root 'solver#start'

  get '/rows' => 'solver#solve_rows'
  get '/new' => 'solver#clean_board'

end
