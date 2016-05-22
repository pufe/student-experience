Rails.application.routes.draw do

  root 'welcome#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  controller :missions do
    get '/mission/available' => :available
    get '/mission/completed' => :completed
    get '/mission/todo' => :todo
    get '/mission/:id' => :show
    post '/mission/accept/:id' => :accept
    post '/mission/reject/:id' => :reject
  end

  controller :questions do
    post '/question/:id/answer' => :answer
  end

  controller :students do
    get '/student/:id' => :show
    post '/student/:id/edit' => :edit
  end
end
