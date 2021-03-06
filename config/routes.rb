Rails.application.routes.draw do

  root 'main#index'

  resources :players, except: [:new, :edit]

  get '/player_info' => "players#player_info"
  resources :badges, except: [:new, :edit]

  #Player Records.
  get '/records' => "records#index"
  get '/records/login'
  get '/records/contribution'
  get '/records/reinforcement'
  get '/records/dissemination'

  #Core of Metagame
  get '/activities' => "activities#record_activity"

  #Statistics
  get '/statistics/total_players'
  get '/statistics/one_time_visitors'
  get '/statistics/boredom_dropouts'
  get '/statistics/players_distribution'
  get '/statistics/daily_activity'

  # Issuing badges
  post   '/issues' => 'issues#create'
  delete '/issues' => 'issues#destroy'
end
