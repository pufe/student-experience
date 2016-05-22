Rails.application.routes.draw do

  root 'welcome#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  controller :students do
    get '/student' => :index
    get '/student/:student_id' => :show
    post '/student/:student_id/edit' => :edit
  end

  controller :adventures do
    get '/adventure/available' => :available
    get '/adventure/todo' => :todo
    get '/adventure/completed' => :completed
    get '/adventure/:adventure_id' => :show
    post '/adventure/accept' => :accept
  end

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
end
