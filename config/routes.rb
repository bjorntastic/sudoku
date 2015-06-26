Rails.application.routes.draw do

  root 'solver#start'

  get '/rows' => 'solver#solve_rows'
  get '/columns' => 'solver#solve_columns'
  get '/boxes' => 'solver#solve_boxes'
  get '/new' => 'solver#clean_board'

end
