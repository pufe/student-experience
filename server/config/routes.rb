Rails.application.routes.draw do


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
    post '/adventure/:adventure_id/accept' => :accept
  end

  controller :missions do
    get '/mission/available' => :available
    get '/mission/completed' => :completed
    get '/mission/todo' => :todo
    get '/mission/:mission_id' => :show
    post '/mission/:mission_id/accept' => :accept
    post '/mission/:mission_id/reject' => :reject
  end

  controller :questions do
    get '/question' => :index
    get '/question/answered' => :answered
    get '/question/unanswered' => :unanswered
    get '/question/:question_id' => :show
    post '/question/:question_id/answer' => :answer
  end

  controller :welcome do
    get '/' => :index
    get '/:partial' => :index
  end

  match '*foo', via: :all, to: lambda {|env| [404, {}, [{status: 404,error: "Not found"}.to_json]] }
end
