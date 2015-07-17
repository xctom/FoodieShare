Rails.application.routes.draw do
  root 'sessions#new'

  ##### Sign Up and Sign In and Sign Out
  get "/signup" => 'users#new'
  post "/users" => 'users#create'
  
  get "/logout" => 'sessions#delete'
  get "/login" => 'sessions#new'
  post '/sessions' => 'sessions#create'
  #########################################################
  # The "Golden 7" for accessing the "posts" resource
  get '/posts' => 'posts#index', as: 'posts'
  
  post '/posts' => 'posts#create'
  
  #no page for single post
  #get '/posts/:id' => 'posts#show', as: 'post'

  #posts can not be re-edit and update
  #get '/posts/:id/edit' => 'posts#edit', as: 'edit_posts'
  #patch '/posts/:id' => 'movies#posts'

  delete '/posts/:id' => 'posts#destroy'
  
  #########################################################
  # The "Golden 7" for accessing the "replies" resource

  post '/replies' => 'replies#create'

  delete '/replies/:id' => 'replies#destroy'

  #########################################################
  # The "Golden 7" for accessing the "users" resource

  #get '/users/new' => 'users#new', as: 'new_user'

  #no users page, there is only page for single user
  get '/users' => 'users#index'
  #get '/users/show' =>'user#show'
  #for register
  #post '/users' => 'users#create'
  get '/users/follows/:id' => 'users#follow', as: 'follow'
  #index page for a single user
  get '/users/:id' => 'users#show', as: 'user'

  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'

  delete '/users/:id' => 'users#destroy'

  #########################################################
  # The "Golden 7" for accessing the "restaurant" resource

  #no new

  #shows a list of restaurant according to get params
  get '/restaurants' => 'restaurants#index', as: 'restaurants'
  get '/restaurants/data' => 'restaurants#get_by_geoLocation'
  #no create

  #for a single resataurant
  get '/restaurants/:id' => 'restaurants#show', as: 'restaurant'

  #search restaurants
  get '/restaurants/search' =>  'restaurants#search', as: 'restaurants_search'

  #no edit,update and destroy
  #########################################################
  # The "Golden 7" for accessing the "follow" resource

  patch '/follow/:id' => 'follow#create', as: 'new_follow'
  delete '/follow/:id' => 'follow#destroy'
  get '/follow/:id/followers' => 'follow#follower_index', as: 'follower_index'
  get '/follow/:id/followees' => 'follow#followee_index', as: 'followee_index'
  get '/follow/:id/follow_index' => 'follow#index', as: 'index'
  #########################################################
  # The "Golden 7" for accessing the "tags" resource
  patch '/tags' => 'tags#update'
end
