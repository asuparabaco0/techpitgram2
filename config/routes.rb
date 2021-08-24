Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # get 'pages/home'
  # asオプションを使うと、ルーティングに名前をつけることができる　user_pathというメソッドが生成される
  get '/users/:id', to:'users#show', as:'user'
  #onlyを使うと、自動で生成される7つのアクションのうちどのアクションのルーティングを追加するか絞り込むことができる
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end

  # get '/posts/new', to:'posts#new'
  # post '/posts', to:'posts#create'

  #photosに関しては、どの投稿に紐づくかのpost_idの情報がないといけないので/photosの前に/posts/:post_idのパスがつく
  # ルーティングをネスト（入れ子）にすることで、親子関係をルーティングで表すことができる
  # post '/posts/:post_id/photos', to:'photos#create', as:'post_photos'
end
